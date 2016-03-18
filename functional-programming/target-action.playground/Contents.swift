//: Playground - noun: a place where people can play

import UIKit

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>: TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() {
        if let target = self.target {
            action(target)()
        }
    }
}

enum ButtonEvent {
    case TouchUpInside
}

class Button {
    var action = [ButtonEvent : TargetAction]()
    
    deinit {
        print("Button is deinitialized")
    }
    
    func setTarget<T: AnyObject>(target: T, action: (T) -> () -> (), event: ButtonEvent) {
        self.action[event] = TargetActionWrapper(target: target, action: action)
    }
    
    func removeTargetForEvent(event: ButtonEvent) {
        self.action[event] = nil
    }
    
    func performActionForEvent(event: ButtonEvent) {
        self.action[event]?.performAction()
    }
}

class MyViewController {
    let button = Button()
    
    deinit {
        print("MyViewController is deinitialized")
    }
    
    func onPressed() {
        print("Button was pressed")
    }
    
    func viewDidLoad() {
        self.button.setTarget(self, action: MyViewController.onPressed, event: .TouchUpInside)
    }
}

func demo() {
    let controllerObj = MyViewController()
    controllerObj.viewDidLoad()
    controllerObj.button.performActionForEvent(.TouchUpInside)
}

demo()
































