//
//  ViewController.swift
//  MenuOptions
//
//  Created by Raksha Singh on 13/03/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LeadingContraint: NSLayoutConstraint!
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        menuView.layer.borderWidth = 2
        menuView.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
         LeadingContraint.constant = -200
    }
    
    @IBAction func openMenu(_ sender: Any) {
        
        if (menuShowing) {
            LeadingContraint.constant = -200
            UIView.animate(withDuration: 0.2 , delay: 0.0 , options: .curveEaseOut , animations: {
                self.view.layoutIfNeeded()
            })
        }
        else {
            LeadingContraint.constant = 0
            UIView.animate(withDuration: 0.2 , delay: 0.0 , options: .curveEaseIn , animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing
    }
}

