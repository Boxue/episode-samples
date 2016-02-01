//
//  ViewController.swift
//  GCDDemo
//
//  Created by Mars on 1/30/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    let imageUrls = [
        "https://dn-boxueio.qbox.me/image1-big.jpg",
        "https://dn-boxueio.qbox.me/image2-big.jpg",
        "https://dn-boxueio.qbox.me/image3-big.jpg",
        "https://dn-boxueio.qbox.me/image4-big.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearDownload(sender: UIButton) {
        self.image1.image = nil
        self.image2.image = nil
        self.image3.image = nil
        self.image4.image = nil
        
        NSURLCache.sharedURLCache().removeAllCachedResponses()
    }

    let queue = NSOperationQueue()
    
    @IBAction func cancelDownload(sender: AnyObject) {
        self.queue.cancelAllOperations()
    }
    @IBAction func downloadImages(sender: UIButton) {
        
        queue.addOperationWithBlock({
            let img1 = Downloader.downloadImageWithURL(self.imageUrls[0])
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.image1.image = img1
                self.image1.clipsToBounds = true
            })
        })
        
        let op2 = NSBlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(self.imageUrls[1])
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.image2.image = img2
                self.image2.clipsToBounds = true
            })
        })
        
        op2.completionBlock = { print("image2 downloaded") }
        
//        queue.addOperation(op2)
        
        let op3 = NSBlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(self.imageUrls[2])
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.image3.image = img3
                self.image3.clipsToBounds = true
            })
        })
        
        op3.completionBlock = { print("image3 is cancelled: \(op3.cancelled)") }
        
//        queue.addOperation(op3)
        
        let op4 = NSBlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(self.imageUrls[3])
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.image4.image = img4
                self.image4.clipsToBounds = true
            })
        })
        
        op4.completionBlock = { print("image4 downloaded") }
        
        queue.addOperation(op4)
        
        op3.addDependency(op4)
        op2.addDependency(op3)
        
        queue.addOperation(op3)
        queue.addOperation(op2)
    }
}























