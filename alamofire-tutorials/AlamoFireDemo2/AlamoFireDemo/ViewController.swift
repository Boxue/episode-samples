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
//        Alamofire.request(.GET, "https://apidemo.boxue.io/alamofire?XDEBUG_SESSION_START=PHPSTORM")
//            .responseJSON(completionHandler: { response in
//                switch response.result {
//                case .Success(let json):
//                    print("JSON: ================")
//                case .Failure(let error):
//                    print("\(error)")
//                }
//            })
//        
        let parameters = [
            "foo": [1,2,3],
            "bar": [
                "baz": "qux"
            ]
        ]
        
        Alamofire.request(.POST, "https://apidemo.boxue.io/alamofire?XDEBUG_SESSION_START=PHPSTORM", parameters: parameters, encoding: .JSON)
                    .responseJSON(completionHandler: { response in
                        switch response.result {
                        case .Success(let json):
                            print("JSON: ================")
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










