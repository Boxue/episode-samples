//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by Mars on 4/2/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    var episodeListItems: [EpisodeListItem] = []
    
    func getEpisodeListItemData() {
        for i in 0..<10 {
            let e = EpisodeListItem()
            e.title = "Episode \(i)"
            e.finished = i % 2 == 0 ? true : false
            
            episodeListItems.append(e)
        }
    }
    
    func documentsDirectory() -> NSURL {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        return urls[0]
    }
    
    func fileUrl(fileName: String) -> NSURL {
        let documentUrl = self.documentsDirectory().URLByAppendingPathComponent(fileName)
        
        return documentUrl
    }
    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "EpisodeItem", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(1024) as! UILabel
        
        let title = self.episodeListItems[indexPath.row].title
        label.text = title
        
        cell.accessoryType = self.episodeListItems[indexPath.row].finished ? .Checkmark : .None
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func saveEpisodeListItems() {
        // 1. Create a NSMutableData object
        let data = NSMutableData()
        // 2. Create a NSKeyedArchiver for data
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        // 3. Encode EpisodeListItems array
        archiver.encodeObject(episodeListItems, forKey: "EpisodeListItems")
        archiver.finishEncoding()
        // 4. Save data to plist file
        let plistUrl = fileUrl("EpisodeList.plist")
        data.writeToURL(plistUrl, atomically: true)
    }
    
    func loadEpisodeListItems() {
        let plistUrl = fileUrl("EpisodeList.plist")
        
        let fileExists = plistUrl.checkResourceIsReachableAndReturnError(nil)
        
        if fileExists {
            // 1. Create a NSData by plistUrl
            let data = NSData(contentsOfURL: plistUrl)
            
            if data != nil {
                // 2. Create a NSKeyedUnarchiver
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
                
                // 3. Decode the object with key EpisodeListItems
                episodeListItems = unarchiver.decodeObjectForKey("EpisodeListItems") as! [EpisodeListItem]
                unarchiver.finishDecoding()
            }
        }
        else {
            getEpisodeListItemData()
            saveEpisodeListItems()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadEpisodeListItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
    
        let documentsDirUrl = documentsDirectory()
        let plistUrl = fileUrl("EpisodeList.plist")
        
        print("Documents dir url: \(documentsDirUrl)")
        print("Plist file url: \(plistUrl)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

