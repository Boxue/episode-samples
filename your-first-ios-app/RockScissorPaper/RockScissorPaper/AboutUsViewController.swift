//
//  AboutUsViewController.swift
//  RockScissorPaper
//
//  Created by Mars on 1/1/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var aboutUs: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let htmlFile = NSBundle.mainBundle().pathForResource("aboutus", ofType: "html")
        
        if (htmlFile != nil) {
            if let htmlData = NSData(contentsOfFile: htmlFile!) {
                let mainBundleUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                self.aboutUs.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: mainBundleUrl)
            }
        }
        
        self.view.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
