//
//  ViewController.swift
//  AlamoFireDemo
//
//  Created by Mars on 2/11/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let requestUrl = "https://apidemo.boxue.io/alamofire?XDEBUG_SESSION_START=PHPSTORM"
//        let noteUrl = "https://apidemo.boxue.io/alamofire/note-list?XDEBUG_SESSION_START=PHPSTORM"
        
        let requestUrl = "https://apidemo.boxue.io/alamofire?XDEBUG_SESSION_START=PHPSTORM"
        
        let parameters = [
            "foo": [1, 2],
            "bar": [
                "x": "a",
                "y": "2"
            ]
        ]
        
        Alamofire.request(.GET, requestUrl, parameters: parameters)
            .responseString(completionHandler: { response in
                switch response.result {
                case .Success(let json):
                    print("JSON: ================")
                    print("\(json)")
                case .Failure(let error):
                    print("\(error)")
                }
            })


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}