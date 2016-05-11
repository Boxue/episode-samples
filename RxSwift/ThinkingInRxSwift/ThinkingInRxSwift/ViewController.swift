//
//  ViewController.swift
//  ThinkingInRxSwift
//
//  Created by Mars on 5/10/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let stringArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        
        let evenArray = stringArray.map { Int($0)! }.filter { $0 % 2 == 0 }
        
        print(evenArray)
        self.userInput.delegate = self
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
        // 1. Map user input string to Int
        if let n = Int(string) {
            // 2. Filter even numbers
            if n % 2 == 0 {
                print(n)
            }
        }
        
        return true
    }
}







