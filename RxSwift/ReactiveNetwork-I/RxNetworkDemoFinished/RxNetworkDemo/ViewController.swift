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
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var repositoryName: UITextField!
    @IBOutlet weak var searchResult: UITableView!
    
    var bag: DisposeBag! = DisposeBag()
    
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
            .subscribeNext {
                let repoCount = $0["total_count"] as! Int;
                let repoItems = $0["items"] as! [RepositoryInfo];
                
                if repoCount != 0 {
                    print("item count: \(repoCount)")
                    
                    for item in repoItems {
                        print("---------------------------------")
                        
                        let name = item["full_name"]
                        let description = item["description"]
                        let avatarUrl = item["avatar_url"]
                        
                        print("full name: \(name)")
                        print("description: \(description)")
                        print("avatar_url: \(avatarUrl)")
                    }
                }
            }.addDisposableTo(self.bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

typealias RepositoryInfo = Dictionary<String, AnyObject>

extension ViewController {
    private func searchForGithub(repositoryName: String) -> Observable<RepositoryInfo> {
        return Observable.create {
            (observer: AnyObserver<RepositoryInfo>) -> Disposable in
                let url = "https://api.github.com/search/repositories"
                let parameters = [ "q": repositoryName + " stars:>2000"]
                let request = Alamofire.request(.GET, url, parameters: parameters, encoding: .URLEncodedInURL)
                    .responseJSON { response in
                        switch response.result {
                        case .Failure(let error):
                            observer.on(.Error(error))
                        case .Success(let json):
                            // How can we handle success event?
                            // 1. Simplify the result
                            let info = self.parseGithubResponse(json)
                            // 2. Send the event
                            observer.on(.Next(info))
                            observer.on(.Completed)
                        }
                    }
            
            return AnonymousDisposable {
                request.cancel()
            }
        }
    }
    
    private func parseGithubResponse(response: AnyObject) -> RepositoryInfo {
        // 1. Init SwiftyJSON
        let json = JSON(response)
        
        // 2. Read total_count
        let totalCount = json["total_count"].int!
        
        var ret: RepositoryInfo = [
            "total_count": totalCount,
            "items": []
        ]
        
        if totalCount != 0 {
            let items = json["items"]
            var info: [RepositoryInfo] = []
            
            for (_, subJson):(String, JSON) in items {
                let fullName = subJson["full_name"].stringValue
                let description = subJson["description"].stringValue
                let htmlUrl = subJson["html_url"].stringValue
                let avatarUrl = subJson["owner"]["avatar_url"].stringValue
                
                info.append([
                    "full_name": fullName,
                    "description": description,
                    "html_url": htmlUrl,
                    "avatar_url": avatarUrl
                ])
            }
            
            ret["items"] = info
        }
        
        return ret
    }
}



























