//
//  ViewController.swift
//  ThinkingInRxSwift
//
//  Created by Mars on 5/10/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var rxUserInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let stringArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        
        let evenArray = stringArray.map { Int($0)! }.filter { $0 % 2 == 0 }
        
        print(evenArray)
        self.userInput.delegate = self
        
        _ = self.rxUserInput.rx_text
            .map { (input: String) -> Int in
                if let lastChar = input.characters.last {
                    if let n = Int(String(lastChar)) {
                        return n
                    }
                }
                
                return -1
            }
            .filter { $0 % 2 == 0 }
            .subscribeNext { print($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                replacementString string: String) -> Bool {
        if textField == self.userInput {
            // 1. Map user input string to Int
            if let n = Int(string) {
                // 2. Filter even numbers
                if n % 2 == 0 {
                    print(n)
                }
            }
        }
        
        return true
    }
}







