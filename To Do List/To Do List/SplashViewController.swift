//
//  SplashViewController.swift
//  To Do List
//
//  Created by Raksha.Singh on 10/18/19.
//  Copyright © 2019 Raksha Singh. All rights reserved.
//
//
import UIKit

class SplashViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.performSegue(withIdentifier: "toDoMaster", sender: nil)
        })
    }
}
