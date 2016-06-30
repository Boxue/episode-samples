//
//  ViewController.swift
//  RxNetworkDemo
//
//  Created by Mars on 6/1/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Alamofire
import SwiftyJSON

class ViewController
    : UIViewController {

    @IBOutlet weak var repositoryName: UITextField!
    @IBOutlet weak var searchResult: UITableView!
    
    typealias SectionTableModel = SectionModel<String, RepositoryModel>
    let dataSource = RxTableViewSectionedReloadDataSource<SectionTableModel>()
    var bag: DisposeBag! = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.searchResult.delegate = self
        
        self.searchResult.rx_itemSelected.subscribeNext {
            [unowned self] in
                self.searchResult.deselectRowAtIndexPath($0, animated: true)
        }.addDisposableTo(self.bag)
        
//        self.searchResult.rxDidSelectRowAtIndexPath.subscribeNext {
//            print("From delegate proxy")
//            $0.deselectRowAtIndexPath($1, animated: true)
//        }.addDisposableTo(self.bag)
        
        self.dataSource.configureCell = { (_, tv, indexPath, element) in
            let cell =
                tv.dequeueReusableCellWithIdentifier(
                    "RepositoryInfoCell",
                    forIndexPath: indexPath) as! RepositoryInfoTableViewCell
            
            cell.name.text = element.name
            cell.detail.text = element.detail
            
            return cell
        }
        
        self.repositoryName.rx_text
            .filter {
                return $0.characters.count > 2
            }
            .throttle(0.5, scheduler: MainScheduler.instance)
            .flatMap {
                self.searchForGithub($0)
            }
            .subscribe(onNext: { repositoryModelArray in
                    // Create UITableView here later
                    self.searchResult.dataSource = nil
                
                    Observable.just(self.createGithubSectionModel(repositoryModelArray))
                        .bindTo(self.searchResult.rx_itemsWithDataSource(self.dataSource))
                        .addDisposableTo(self.bag)
                    self.dataSource.canEditRowAtIndexPath = { (_, _) in false }
                
                }, onError: { error in
                    self.displayErrorAlert(error as NSError)
                }).addDisposableTo(self.bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("From native delegate")
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionCount = self.dataSource.numberOfSectionsInTableView(tableView)
        
        guard sectionCount != 0 else {
            return nil
        }
        
        let label = UILabel(frame: CGRect.zero)
        label.text = self.dataSource.sectionAtIndex(section).model ?? ""
        
        return label
    }
}

extension ViewController {
    private func createGithubSectionModel(repoInfo: [RepositoryModel]) -> [SectionTableModel] {
        var ret: [SectionTableModel] = []
        var items: [RepositoryModel] = []
        
        if (repoInfo.count <= 10) {
            ret.append(
                SectionTableModel(model: "Top 1 - 10", items: repoInfo)
            )
        }
        else {
            for i in 1...repoInfo.count {
                items.append(repoInfo[i - 1])
                
                let isSectionBreak = i / 10 != 0 && i % 10 == 0
                
                if (isSectionBreak) {
                    ret.append(
                        SectionTableModel(model: "Top \(i - 9) - \(i)", items: items)
                    )
                    
                    items = []
                }
            }
        }
        
        return ret
    }
    
    private func searchForGithub(repositoryName: String) -> Observable<[RepositoryModel]> {
        return Observable.create {
            (observer: AnyObserver<[RepositoryModel]>) -> Disposable in
            
            let url = "https://api.github.com/search/repositories"
            let parameters = [
                "q": repositoryName + " stars:>=2000"
            ]
            
            let request = Alamofire.request(.GET, url,
                parameters: parameters, encoding: .URLEncodedInURL)
                .responseJSON { response in
                    switch response.result {
                    case .Success(let json):
                        let info = self.parseGithubResponse(json)
                        
                        observer.on(.Next(info))
                        observer.on(.Completed)
                    case .Failure(let error):
                        observer.on(.Error(error))
                    }
            }
            
            return AnonymousDisposable {
                request.cancel()
            }
        }
    }
    
    private func parseGithubResponse(response: AnyObject) -> [RepositoryModel] {
        let json = JSON(response);
        let totalCount = json["total_count"].int!
        var ret: [RepositoryModel] = []
        
        if totalCount != 0 {
            let items = json["items"]
            
            for (_, subJson):(String, JSON) in items {
                let fullName = subJson["full_name"].stringValue
                let description = subJson["description"].stringValue
                let htmlUrl = subJson["html_url"].stringValue
                let avatarUrl = subJson["owner"]["avatar_url"].stringValue
                
                ret.append(RepositoryModel(
                    name: fullName,
                    detail:
                    description,
                    htmlUrl: htmlUrl,
                    avatar: avatarUrl))
            }
        }
        
        return ret
    }
    
    private func displayErrorAlert(error: NSError) {
        let alert = UIAlertController(title: "Network error",
                                      message: error.localizedDescription,
                                      preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
