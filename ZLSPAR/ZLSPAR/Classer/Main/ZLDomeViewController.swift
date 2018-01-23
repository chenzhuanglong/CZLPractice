//
//  ZLDomeViewController.swift
//  ZLSPAR
//
//  Created by yuzeux on 2017/12/26.
//  Copyright © 2017年 晶石. All rights reserved.
//

import UIKit

class ZLDomeViewController: ZLBaseViewController {
    
    @IBOutlet var display: UILabel!
    //swift要求所有属性都要初始化
    //使用两种方法初始化,一种是用构造器方法init,一种是直接赋值
    var userIsInTheMiddleOfTypping: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true;
        self.title = "DOME"
//        CountableRange
        
        for i in stride(from: 0.2, to: 3.4, by: 0.2) {
            print(i)
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypping {
            let textCurrentlyInDisplay = display.text!
            display.text! = textCurrentlyInDisplay + digit
        }else {
            display.text = digit
            userIsInTheMiddleOfTypping = true
        }
    }
    
    var displayValue : Double {
        get {
            return  Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTypping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTypping = false
        }
       
        if let mathematicalSymbol = sender.currentTitle {
               brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result {
             displayValue = result
        }
       
    }
    
}
