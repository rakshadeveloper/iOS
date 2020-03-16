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
    
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Transparent View Intial Behaviour
        transparentView.backgroundColor = .clear
        transparentView.isHidden = true
        
       // Tap Gesture
       let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(tap:)))
       view.addGestureRecognizer(tap)
       tap.numberOfTapsRequired = 1
        
        // Menu View Layer and Frames
        menuView.layer.borderWidth = 2
        menuView.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        
        // Menu View LeadingContraint for appera When click
         LeadingContraint.constant = -200
    }
    
    // Tap Gesture
    @objc func handleTap(tap: UITapGestureRecognizer) {

        guard tap.view != nil else { return }
        
        if tap.state == .ended {

            LeadingContraint.constant = -200
            UIView.animate(withDuration: 0.2 , delay: 0.0 , options: .curveEaseOut , animations: {
                self.view.layoutIfNeeded()
            })
            transparentView.isHidden = true
            menuShowing = !menuShowing
        }
    }
    
    // Click Menu Button Action
    @IBAction func openMenu(_ sender: Any) {
        
        if (menuShowing) {
            LeadingContraint.constant = -200
            UIView.animate(withDuration: 0.2 , delay: 0.0 , options: .curveEaseOut , animations: {
                self.view.layoutIfNeeded()
            })
            transparentView.backgroundColor = UIColor.brown
            transparentView.backgroundColor = .clear
            transparentView.isHidden = true

        }
        else {
            LeadingContraint.constant = 0
            UIView.animate(withDuration: 0.2 , delay: 0.0 , options: .curveEaseIn , animations: {
                self.view.layoutIfNeeded()
            })
            transparentView.backgroundColor = .clear
            transparentView.isHidden = false
        }
        menuShowing = !menuShowing
    }
}

