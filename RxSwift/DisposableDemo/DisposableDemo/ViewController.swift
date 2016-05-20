//
//  ViewController.swift
//  DisposableDemo
//
//  Created by Mars on 5/20/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var interval: Observable<Int>!
    var subscription: Disposable!
    var bag: DisposeBag! = DisposeBag()

    @IBOutlet weak var counter: UITextField!
    @IBOutlet weak var disposeCounter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.interval = Observable.interval(0.5, scheduler: MainScheduler.instance)
        self.subscription = self.interval.map { return String($0) }.subscribeNext { self.counter.text = $0 }
        self.subscription.addDisposableTo(self.bag)
        
        _ = self.disposeCounter.rx_tap.subscribeNext({
            print("Dispose interval")
            self.bag = nil
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

