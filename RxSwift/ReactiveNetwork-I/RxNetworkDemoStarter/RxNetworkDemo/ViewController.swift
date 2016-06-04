//
//  ViewController.swift
//  RxNetworkDemo
//
//  Created by Mars on 6/1/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var repositoryName: UITextField!
    @IBOutlet weak var searchResult: UITableView!
    
    var bag: DisposeBag! = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

