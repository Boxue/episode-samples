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

    @IBAction func downloadInMainThread(sender: UIButton) {
        self.image1.image = Downloader.downloadImageWithURL(self.imageUrls[0])
        self.image1.clipsToBounds = true
        
        self.image2.image = Downloader.downloadImageWithURL(self.imageUrls[1])
        self.image2.clipsToBounds = true
        
        self.image3.image = Downloader.downloadImageWithURL(self.imageUrls[2])
        self.image3.clipsToBounds = true
        
        self.image4.image = Downloader.downloadImageWithURL(self.imageUrls[3])
        self.image4.clipsToBounds = true
    }
}

