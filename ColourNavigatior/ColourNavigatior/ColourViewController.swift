//
//  ColourViewController.swift
//  ColourNavigatior
//
//  Created by Raksha.Singh on 10/22/19.
//  Copyright © 2019 Raksha.Singh. All rights reserved.
//

import UIKit

class ColourViewController: UIViewController {
    var titleText = String()
    var color = UIColor()

    @IBOutlet weak var lbColourOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbColourOutlet.text = titleText
        self.view.backgroundColor = color

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
