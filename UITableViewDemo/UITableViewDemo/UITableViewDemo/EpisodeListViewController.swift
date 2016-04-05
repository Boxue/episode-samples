//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by Mars on 4/2/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "EpisodeItem", forIndexPath: indexPath)
        
        return cell
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

