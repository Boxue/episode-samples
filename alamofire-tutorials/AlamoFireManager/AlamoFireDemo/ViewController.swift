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

    lazy var defManager: Manager = {
        // Step 1 Get additional HTTP header
        var defHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        
        // Step 2 Set a NSURLSessionConfiguration
        let conf = NSURLSessionConfiguration.defaultSessionConfiguration()
        conf.HTTPAdditionalHeaders = defHeaders
        
        // Step 3 Generate a manager
        return Alamofire.Manager(configuration: conf)
    }()
    
    lazy var backgroundManager: Manager = {
        // Step 1 Get additional HTTP header
        var defHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        
        // Step 2 Set a NSURLSessionConfiguration
        let conf = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("io.boxue.api.background")
        conf.HTTPAdditionalHeaders = defHeaders
        
        // Step 3 Generate a manager
        return Alamofire.Manager(configuration: conf)
    }()
    
    lazy var ephemeralManager: Manager = {
        // Step 1 Get additional HTTP header
        var defHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        
        // Step 2 Set a NSURLSessionConfiguration
        let conf = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        conf.HTTPAdditionalHeaders = defHeaders
        
        // Step 3 Generate a manager
        return Alamofire.Manager(configuration: conf)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let requestUrl = "https://apidemo.boxue.io/alamofire"
       
        let manager = Alamofire.Manager.sharedInstance
        defManager.request(.GET, requestUrl)
            .responseString(completionHandler: { response in
                switch response.result {
                case .Success(let str):
                    print("Response String: =================")
                    print("\(str)")
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