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

        var requestUrl =
        "https://apidemo.boxue.io/alamofire?XDEBUG_SESSION_START=PHPSTORM"
        // Define a simple KV parameter
        let parameters = [
                "foo": [1, 2],
                "bar": [
                        "x": "a",
                        "y": 2
                ]
        ]

        // Parameters encoding in URL
        // [ "foo": [1, 2]]
        // [ "bar": ["x": "a", "y": 2]]
//        let requestParameters = "&foo[]=1&foo[]=2&bar[x]=a&bar[y]=2"
//        requestUrl = requestUrl + requestParameters
//        requestUrl.stringByAddingPercentEncodingWithAllowedCharacters(
//            NSCharacterSet.URLQueryAllowedCharacterSet()
//        )
        // .URL
        // HEAD / GET / DELETE - Put encoded parameter in request uri
        // Others - in HTTP body
        // .URLEncodedInURL
        // Always put encoded parameters in request url
        Alamofire.request(.POST,
                requestUrl,
                parameters: parameters,
                encoding: .JSON)
//        Alamofire.request(.GET, requestUrl)
        .responseJSON(completionHandler: { response in
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