//
//  AboutYouViewController.swift
//  ReactiveLogin
//
//  Created by Mars on 5/23/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum Gender {
    case notSelected
    case male
    case female
}

class AboutYouViewController: UIViewController {

    // UIDatePicker
    @IBOutlet weak var birthday: UIDatePicker!
    
    // 2 in 1 UIButton
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var female: UIButton!
    
    // UISwith and UISlider
    @IBOutlet weak var knowSwift: UISwitch!
    @IBOutlet weak var swiftLevel: UISlider!
    
    // UIStepper
    @IBOutlet weak var passionToLearn: UIStepper!
    @IBOutlet weak var heartHeight: NSLayoutConstraint!
    
    // Update button
    @IBOutlet weak var update: UIButton!
    
    // Disposable collector
    var bag: DisposeBag! = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let birthdayObservable = self.birthday.rx_date.map {
            InputValidator.isValidDate($0)
        }
        
        self.birthday.layer.borderWidth = 1
        birthdayObservable.map {
                $0 ? UIColor.greenColor() : UIColor.clearColor()
            }.subscribeNext({
                self.birthday.layer.borderColor = $0.CGColor
            }).addDisposableTo(self.bag)
        
        let genderSelection = Variable<Gender>(.notSelected)
        
        self.male.rx_tap.map {
            return Gender.male
        }
        .bindTo(genderSelection)
        .addDisposableTo(self.bag)
        
        self.female.rx_tap.map {
            return Gender.female
        }
        .bindTo(genderSelection)
        .addDisposableTo(self.bag)
        
        genderSelection.asObservable().subscribeNext({
            switch $0 {
            case .male:
                self.male.setImage(UIImage(named: "checked"), forState: .Normal)
                self.female.setImage(UIImage(named: "unchecked"), forState: .Normal)
            case .female:
                self.male.setImage(UIImage(named: "unchecked"), forState: .Normal)
                self.female.setImage(UIImage(named: "checked"), forState: .Normal)
            default:
                break
            }
        }).addDisposableTo(self.bag)
        
        let genderBtnObservable = genderSelection.asObservable().map {
            return $0 != .notSelected ? true : false
        }
        
        Observable.combineLatest(birthdayObservable, genderBtnObservable) {
                return [$0, $1]
            }.map {
                $0.reduce(true, combine: { $0 && $1})
            }
            .bindTo(self.update.rx_enabled)
            .addDisposableTo(self.bag)
        
        self.knowSwift.rx_value.map {
            $0 ? 0.25 : 0
        }
        .bindTo(self.swiftLevel.rx_value)
        .addDisposableTo(self.bag)
        
        self.swiftLevel.rx_value.map {
            $0 != 0 ? true : false
        }
        .bindTo(self.knowSwift.rx_value)
        .addDisposableTo(self.bag)
        
        self.passionToLearn.rx_value.skip(1).subscribeNext({
            self.heartHeight.constant = CGFloat($0 - 10)
        }).addDisposableTo(self.bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
