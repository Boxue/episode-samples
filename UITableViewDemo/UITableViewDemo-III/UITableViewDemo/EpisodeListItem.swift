//
//  EpisodeListItem.swift
//  UITableViewDemo
//
//  Created by Mars on 4/8/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import Foundation

class EpisodeListItem: NSObject, NSCoding {
    var title = ""
    var finished = false
    
    // Methods in NSCoding
    // How to encode EpisodeListItem attributes
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "Title")
        aCoder.encodeBool(finished, forKey: "Finished")
    }
    
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObjectForKey("Title") as! String
        finished = aDecoder.decodeBoolForKey("Finished")
        super.init()
    }
    
    override init() {
        super.init()
    }
}