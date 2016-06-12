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
    
    var bag: DisposeBag! = DisposeBag()
    
    typealias SectionTableModel = SectionModel<String, RepositoryModel>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.repositoryName.rx_text
            .filter {
                return $0.characters.count > 2
            }
            .throttle(0.5, scheduler: MainScheduler.instance)
            .flatMap {
                self.searchForGithub($0)
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController {
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
