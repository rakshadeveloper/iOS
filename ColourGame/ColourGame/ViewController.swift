//
//  ViewController.swift
//  ColourGame
//
//  Created by Raksha Singh on 05/11/19.
//  Copyright © 2019 Raksha Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func btStartbutton(_ sender: Any) {
        self.performSegue(withIdentifier: "start", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "StartScreenPhoto.png")!)
        // Do any additional setup after loading the view.
    }
    
    
}

