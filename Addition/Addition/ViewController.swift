//
//  ViewController.swift
//  Addition
//
//  Created by Raksha.Singh on 10/23/19.
//  Copyright © 2019 Raksha.Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var total: Int = 1
    @IBOutlet weak var tfNunber1Outlet: UITextField!
    @IBOutlet weak var tfNumber2Outlet: UITextField!
    @IBOutlet weak var lbTotalOutlet: UILabel!
    @IBAction func btAddButton(_ sender: Any) {
        var number1: Int? = Int (tfNunber1Outlet.text!)
        var number2: Int? = Int (tfNumber2Outlet.text!)
        var totalSum: Int = Int (number1! + number2!)
        lbTotalOutlet.text = "\(totalSum)"
    }
    @IBAction func btSubtractButton(_ sender: Any) {
        var number1: Int? = Int (tfNunber1Outlet.text!)
        var number2: Int? = Int (tfNumber2Outlet.text!)
        var totalSub: Int = Int (number1! - number2!)
        lbTotalOutlet.text = "\(totalSub)"
    }
    
    @IBAction func btMultiplyButton(_ sender: Any) {
        var number1: Int? = Int (tfNunber1Outlet.text!)
        var number2: Int? = Int (tfNumber2Outlet.text!)
        var totalMul: Int = Int (number1! * number2!)
        lbTotalOutlet.text = "\(totalMul)"
    }
    
    @IBAction func btDevideButton(_ sender: Any) {
        var number1: Int? = Int (tfNunber1Outlet.text!)
        var number2: Int? = Int (tfNumber2Outlet.text!)
        var totalDvid: Int = Int (number1! / number2!)
        lbTotalOutlet.text = "\(totalDvid)"
    }
    @IBAction func btPowerButton(_ sender: Any) {
        var number1: Int? = Int (tfNunber1Outlet.text!)
        var number2: Int? = Int (tfNumber2Outlet.text!)
        if number2 == 0 {
            lbTotalOutlet.text = "\(total)"
            
        }
        else{
            for i in 1...Int(number2!) {
                total *= Int (number1!)
            }
            lbTotalOutlet.text = "\(total)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

