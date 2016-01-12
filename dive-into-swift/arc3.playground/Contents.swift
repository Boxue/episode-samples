//: Playground - noun: a place where people can play

import UIKit

//: #### Reference cycle for closure

class HTMLElment {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        // <name>text</name>
        // Capture list
        [unowned self] () -> String in
        if let text = self.text {
            return "<\(self.name)>\(self.text)</\(self.name)>"
        }
        else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(self.name) is being deinitialized")
    }
}

var h1: HTMLElment? = HTMLElment(name: "h1", text: "Title")   // <h1>Title</h1>
h1!.asHTML
h1 = nil











