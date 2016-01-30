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

    @IBAction func downloadImages(sender: UIButton) {
        // Create serial queue
        let serialQueue1 = dispatch_queue_create("com.boxueio.images", DISPATCH_QUEUE_SERIAL)
        // Add task
        dispatch_async(serialQueue1, {
            let img1 = Downloader.downloadImageWithURL(self.imageUrls[0])
            dispatch_async(dispatch_get_main_queue(), {
                self.image1.image = img1
                self.image1.clipsToBounds = true
            })
            
            
            let img3 = Downloader.downloadImageWithURL(self.imageUrls[2])
            dispatch_async(dispatch_get_main_queue(), {
                self.image3.image = img3
                self.image3.clipsToBounds = true
            })
            
        })
        let serialQueue2 = dispatch_queue_create("com.boxueio.images1", DISPATCH_QUEUE_SERIAL)
        
        dispatch_async(serialQueue2, {
            let img2 = Downloader.downloadImageWithURL(self.imageUrls[1])
            dispatch_async(dispatch_get_main_queue(), {
                self.image2.image = img2
                self.image2.clipsToBounds = true
            })
            
            let img4 = Downloader.downloadImageWithURL(self.imageUrls[3])
            dispatch_async(dispatch_get_main_queue(), {
                self.image4.image = img4
                self.image4.clipsToBounds = true
            })
        })

    }
}

