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
        Alamofire.request(.GET, "https://httpbin.org/get")
            .response { request, response, data, error in
                print(request)
                print(response)
                print(data)
                print(data.dynamicType)
                print(error)
                print(error.dynamicType)
            }
            .responseString(completionHandler: { response in
                print("String ===============")
                
                switch response.result {
                case .Success(let str):
                    print("\(str.dynamicType)")
                    print("\(str)")
                case .Failure(let error):
                    print("\(error)")
                }
            })
            .responseJSON(completionHandler: { response in
                print("JSON ================")
                
                switch response.result {
                case .Success(let json):
                    let dict = json as! Dictionary<String, AnyObject>
                    let origin = dict["origin"] as! String
                    let headers = dict["headers"] as! Dictionary<String, String>
                    
                    print("origin: \(origin)")
                    let ua = headers["User-Agent"]
                    print("UA: \(ua)")
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










