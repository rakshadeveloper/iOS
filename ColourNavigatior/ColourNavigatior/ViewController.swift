//
//  ViewController.swift
//  ColourNavigatior
//
//  Created by Raksha.Singh on 10/22/19.
//  Copyright © 2019 Raksha.Singh. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    let colorDic: [String: UIColor] = ["Blue": UIColor.blue, "Green": UIColor.green, "Red": UIColor.red, "Orange": UIColor.orange, "Yellow": UIColor.yellow]


    
    
    var titleOfButton = String()
    @IBAction func btBlueAction(_ sender: Any) {
        if let buttonTitle = (sender as? UIButton)?.titleLabel?.text {
            titleOfButton = buttonTitle
        }
        performSegue(withIdentifier: "colour", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController = segue.destination as! ColourViewController
        
        if titleOfButton.count > 0  {
            destViewController.titleText = titleOfButton
            destViewController.color = colorDic[titleOfButton]!
        }else{
             destViewController.titleText = "Not Found"
        }
    }
    
    
    @IBAction func btGreenAction(_ sender: Any) {
        if let buttonTitle = (sender as? UIButton)?.titleLabel?.text {
        titleOfButton = buttonTitle
        }
        performSegue(withIdentifier: "colour", sender: self)
    }
    @IBAction func btOrangeAction(_ sender: Any) {
        if let buttonTitle = (sender as? UIButton)?.titleLabel?.text {
        titleOfButton = buttonTitle
        }
        performSegue(withIdentifier: "colour", sender: self)
    }
    @IBAction func btYellowAction(_ sender: Any) {
        if let buttonTitle = (sender as? UIButton)?.titleLabel?.text {
        titleOfButton = buttonTitle
        }
        performSegue(withIdentifier: "colour", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}

