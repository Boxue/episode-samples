//
//  ViewController.swift
//  ReactiveLogin
//
//  Created by Mars on 5/21/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var register: UIButton!
    
    var bag: DisposeBag! = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.email.layer.borderWidth = 1
        self.password.layer.borderWidth = 1
        
        let emailObservable = self.email.rx_text.map { (input: String) -> Bool in
            return InputValidator.isValidEmail(input)
        }
        
        emailObservable.map { (valid: Bool) -> UIColor in
                return valid ? UIColor.greenColor() : UIColor.clearColor()
            }.subscribeNext {
                self.email.layer.borderColor = $0.CGColor
            }.addDisposableTo(self.bag)
        
        let passwordObservable = self.password.rx_text.map { (input: String) -> Bool in
            return InputValidator.isValidPassword(input)
        }
        
        passwordObservable.map { (valid: Bool) -> UIColor in
                return valid ? UIColor.greenColor() : UIColor.clearColor()
            }.subscribeNext {
                self.password.layer.borderColor = $0.CGColor
            }.addDisposableTo(self.bag)
        
        Observable.combineLatest(emailObservable, passwordObservable) {
            (validEmail: Bool, validPassword: Bool) -> [Bool] in
                return [validEmail, validPassword]
            }.map { (input: [Bool]) -> Bool in
                return input.reduce(true, combine: { $0 && $1 })
            }.subscribeNext {
                self.register.enabled = $0
            }.addDisposableTo(self.bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
