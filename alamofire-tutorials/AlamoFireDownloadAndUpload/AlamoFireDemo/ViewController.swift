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
    @IBOutlet weak var progress: UILabel!
    
    static func saveFileInDocumentDirectory(fileName: String, subDirectory: String? = nil) -> NSURL{
        let fm = NSFileManager.defaultManager();
        
        var directoryUrl = fm.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        if let subDirectory = subDirectory {
            directoryUrl = directoryUrl.URLByAppendingPathComponent(subDirectory)
            do {
                try fm.createDirectoryAtURL(directoryUrl, withIntermediateDirectories: true, attributes: nil)
            }
            catch let error as NSError{
                print(error.dynamicType)
                print("\(error.localizedDescription)")
            }
        }
      
        directoryUrl = directoryUrl.URLByAppendingPathComponent(fileName)
        return directoryUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.progress.text = "0%"
        
        let user = "11@boxue.io"
        let pw = "boxue"
        let credential = NSURLCredential(user: user, password: pw, persistence: .ForSession)
        Alamofire.request(.POST, "https://apidemo.boxue.io/alamofire")
            .authenticate(usingCredential: credential)
            .responseJSON(completionHandler: { response in
                debugPrint(response)
            })
        
//        let credentialData = "\(user):\(pw)".dataUsingEncoding(NSUTF8StringEncoding)!
//        let base64Credentials = credentialData.base64EncodedStringWithOptions([])
//        
//        let headers = ["Authorization": "Basic \(base64Credentials)"]
//        Alamofire.request(.POST, "https://apidemo.boxue.io/alamofire", headers: headers)
//            .responseJSON(completionHandler: { response in
//                debugPrint(response)
//            })

        
        
//        Alamofire.download(.GET, "https://dn-boxue-free-video.qbox.me/Learning-Vue-Hello-Databinding-a069fe3e22bcc34fe78cbf53af82fd7e.mp4") { temporaryURL, response in
//            let fileName = response.suggestedFilename! + ".tmp"
//            let dirUrl = ViewController.saveFileInDocumentDirectory(fileName, subDirectory: "images")
//            
//            return dirUrl
//            }
//            .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
//                print("=============================")
//                print("Bytes read: \(bytesRead)")
//                print("TotalBytesRead: \(totalBytesRead)")
//                print("TotalBytesExpectedToRead: \(totalBytesExpectedToRead)")
//                
//                dispatch_async(dispatch_get_main_queue()) {
//                    let percent = Double(totalBytesRead) / Double(totalBytesExpectedToRead) * 100.0
//                    self.progress.text = String(format: "%.2f", percent) + "%"
//                };
//            }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}