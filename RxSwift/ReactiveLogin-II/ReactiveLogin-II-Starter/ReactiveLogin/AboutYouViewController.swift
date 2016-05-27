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

class AboutYouViewController: UIViewController {

    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var female: UIButton!
    @IBOutlet weak var knowSwift: UISwitch!
    @IBOutlet weak var swiftLevel: UISlider!
    @IBOutlet weak var passionToLearn: UIStepper!
    @IBOutlet weak var heartHeight: NSLayoutConstraint!
    @IBOutlet weak var update: UIButton!
    
    var bag: DisposeBag! = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
