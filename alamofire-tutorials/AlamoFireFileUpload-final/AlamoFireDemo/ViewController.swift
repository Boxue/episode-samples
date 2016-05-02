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
    var request: Alamofire.Request?
    var episodeUrl: NSURL?
    
    @IBOutlet weak var downloadUrl: UITextField!
    @IBOutlet weak var downloadProgress: UIProgressView!
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var suspendOrResumeBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var uploadBtn: UIButton!
    
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
    private func displayNetworkAlert(
        errorMessage: String,
        data: NSData? = nil,
        destination: Request.DownloadFileDestination? = nil
        ) {
        // 1. Create a UIAlertController object
        let alert = UIAlertController(title: "Network error", message: errorMessage, preferredStyle: .Alert)
        
        // 2. Add different actions according to data
        if let data = data {
            let resume = UIAlertAction(
                title: "Resume",
                style: .Default,
                handler: { _ in
                    print("Resume downloading...")
                    
                    if let destination = destination {
                        defer {
                            Alamofire.download(resumeData: data, destination: destination)
                                .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
                                    dispatch_async(dispatch_get_main_queue()) {
                                        let progress = Float(totalBytesRead) / Float(totalBytesExpectedToRead)
                                        self.downloadProgress.progress = progress
                                    }
                                }
                        }
                    }
                }
            )
            
            alert.addAction(resume)
            
            let cancel = UIAlertAction(
                title: "Cancel",
                style: .Cancel,
                handler: { _ in
                    print("Cancel downloading...")
                    
                    self.downloadUrl.text = nil
                    self.downloadProgress.progress = 0
                    self.beginBtn.enabled = false
                    self.suspendOrResumeBtn.enabled = false
                    self.cancelBtn.enabled = false
                }
            )
            
            alert.addAction(cancel)
        }
        else {
            let cancel = UIAlertAction(
                title: "OK",
                style: .Cancel,
                handler: { _ in
                    print("Cancel downloading...")
                    
                    self.downloadUrl.text = nil
                    self.downloadProgress.progress = 0
                    self.beginBtn.enabled = false
                    self.suspendOrResumeBtn.enabled = false
                    self.cancelBtn.enabled = false
                }
            )
            
            alert.addAction(cancel)
        }
        
        // 3. Display the UIAlertController
        self.presentViewController(alert, animated: true, completion: nil)
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
        let dest: Request.DownloadFileDestination = {
            temporaryUrl, response in
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
            self.episodeUrl = episodeUrl
            return episodeUrl
        }
        
        if let resUrl = self.downloadUrl.text {
            self.request = Alamofire.download(.GET, resUrl, destination: dest)
                .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    // Put the update code into the main thread
                    dispatch_async(dispatch_get_main_queue()) {
                        // Calculate the download percentage
                        let progress = Float(totalBytesRead) / Float(totalBytesExpectedToRead)
                        
                        self.downloadProgress.progress = progress
                    }
                }
                .response { _, _, data, error in
                    if let error = error {
                        print("Download error: \(error.localizedDescription)")
                        
                        if let data = data {
                            print("Resume data exists")
                            
                            self.displayNetworkAlert(
                                error.localizedDescription,
                                data: data,
                                destination: dest
                            )
                        }
                        else {
                            print("Resume data is nil")
                            
                            self.displayNetworkAlert(
                                error.localizedDescription
                            )
                        }
                    }
                    else {
                        // Download successfully
                        self.uploadBtn.enabled = true
                        
                        let alert = UIAlertController(title: "Success",
                            message: "Download finished successfully!",
                            preferredStyle: .Alert)
                        
                        alert.addAction(UIAlertAction(
                            title: "OK",
                            style: UIAlertActionStyle.Default,
                            handler: { _ in
                                print("Finish downloading...")
                                
                                self.downloadUrl.text = nil
                                self.downloadProgress.progress = 0
                                self.beginBtn.enabled = false
                                self.suspendOrResumeBtn.enabled = false
                                self.cancelBtn.enabled = false
                        }))
                        
                        self.presentViewController(alert, animated: true, completion: nil)
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
            self.request!.suspend()
            
            self.currStatus = .Suspended
            btnTitle = "Resume"
            
        case .Suspended:
            print("Resume downloading...")
            
            // TODO: Add resuming code here
            self.request!.resume()
            
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
            self.request!.cancel()
            
            self.currStatus = .Cancelled
            self.cancelBtn.enabled = false
            self.suspendOrResumeBtn.enabled = false
            self.suspendOrResumeBtn.setTitle("Suspend", forState: UIControlState.Normal)
        default:
            break
        }
    }
    
    @IBAction func uploadFile(sender: AnyObject) {
        guard self.episodeUrl != nil else {
            print("Does not have any downloaded file.")
            return
        }
        
        print("Uploading \(self.episodeUrl!)")
        
        // TODO: add uploading code here
        Alamofire.upload(
            .POST,
            "https://apidemo.boxue.io/alamofire",
            multipartFormData: { multipartFormData in
                multipartFormData.appendBodyPart(
                    fileURL: self.episodeUrl!,
                    name: "episode-demo"
                )
            },
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .Success(let request, _, _):
                    request.progress { byteWritten, totalBytesWritten, totalBytesExpectedToWrite in
                        dispatch_async(dispatch_get_main_queue()) {
                            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
                            
                            self.downloadProgress.progress = progress
                        }
                    }
                    .responseJSON { response in
                        debugPrint(response)
                    }
                case .Failure(let encodingError):
                    print(encodingError)
                }
            }
        )
    }
}








































