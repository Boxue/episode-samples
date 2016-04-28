//
//  ViewController.swift
//  AlamoFireDemo
//
//  Created by Mars on 2/11/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit
import Alamofire

enum DownloadStatus {
    case NotStarted
    case Downloading
    case Suspended
    case Cancelled
}

class ViewController: UIViewController {
    var currStatus = DownloadStatus.NotStarted
    
    @IBOutlet weak var downloadUrl: UITextField!
    @IBOutlet weak var downloadProgress: UIProgressView!
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var suspendOrResumeBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if !self.episodesDirUrl.checkResourceIsReachableAndReturnError(nil) {
            try! NSFileManager.defaultManager()
                .createDirectoryAtURL(self.episodesDirUrl,
                                withIntermediateDirectories: true,
                                attributes: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    var documentsDirUrl: NSURL {
        let fm = NSFileManager.defaultManager()
        let url = fm.URLsForDirectory(.DocumentDirectory,
                                    inDomains: .UserDomainMask)[0]
        
        return url
    }
    
    var episodesDirUrl: NSURL {
        let url = self.documentsDirUrl
                    .URLByAppendingPathComponent("episodes", isDirectory: true)
        
        return url
    }
}

extension ViewController {
    @IBAction func valueChanged(sender: UITextField) {
        print("text field: \(sender.text)")
        
        if sender.text != "" {
            self.beginBtn.enabled = true
        }
        else {
            self.beginBtn.enabled = false
        }
    }
    
    // Button actions
    @IBAction func beginDownload(sender: AnyObject) {
        print("Begin downloading...")
        
        // TODO: Add begin downloading code here
        let dest: Request.DownloadFileDestination = { temporaryUrl, response in
            print(temporaryUrl)
            
            // 1. Get the downloaded file name
            let pathComponent = response.suggestedFilename
            
            // 2. Generate the destination file NSURL
            let episodeUrl = self.episodesDirUrl.URLByAppendingPathComponent(pathComponent!)
            
            // 3. Check if the destination file already exists
            if episodeUrl.checkResourceIsReachableAndReturnError(nil) {
                print("Clear the previous existing file")
                
                let fm = NSFileManager.defaultManager()
                
                try! fm.removeItemAtURL(episodeUrl)
            }
            
            // 4. Return the destination file NSURL
            return episodeUrl
        }
        
        if let resUrl = self.downloadUrl.text {
            Alamofire.download(.GET, resUrl, destination: dest)
                .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    // Put the update code into the main thread
                    dispatch_async(dispatch_get_main_queue()) {
                        // Calculate the download percentage
                        let progress = Float(totalBytesRead) / Float(totalBytesExpectedToRead)
                        
                        self.downloadProgress.progress = progress
                    }
            }
        }
        
        self.suspendOrResumeBtn.enabled = true;
        self.cancelBtn.enabled = true;
        self.currStatus = .Downloading
    }
    
    @IBAction func suspendOrResumeDownload(sender: AnyObject) {
        var btnTitle: String?
        
        switch self.currStatus {
        case .Downloading:
            print("Suspend downloading...")
            
            // TODO: Add suspending code here
            
            
            self.currStatus = .Suspended
            btnTitle = "Resume"
            
        case .Suspended:
            print("Resume downloading...")
            
            // TODO: Add resuming code here
            self.currStatus = .Downloading
            btnTitle = "Suspend"
            
        case .NotStarted, .Cancelled:
            break
        }
        
        self.suspendOrResumeBtn.setTitle(btnTitle, forState: UIControlState.Normal)
    }
    
    @IBAction func cancelDownload(sender: AnyObject) {
        print("Cancel downloading...")
        
        switch self.currStatus {
        case .Downloading, .Suspended:
            // TODO: Add cancel code here
            
            self.currStatus = .Cancelled
            self.cancelBtn.enabled = false
            self.suspendOrResumeBtn.enabled = false
            self.suspendOrResumeBtn.setTitle("Suspend", forState: UIControlState.Normal)
        default:
            break
        }
    }
}