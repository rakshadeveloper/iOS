//
//  AddToDoDetailViewController.swift
//  To Do List
//
//  Created by Raksha.Singh on 10/18/19.
//  Copyright © 2019 Raksha Singh. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class AddToDoDetailViewController: UIViewController {
    
    @IBOutlet weak var tfToDoTitleOutlet: UITextField!
    var detailedText = String()
    var titleText = String()
    
    
    @IBOutlet weak var tvToDoDescriptionOutlet: UITextView!
    @IBAction func saveDetailButton(_ sender: Any) {
//        detailedArray = toDoDetaillabel.text!
            
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfToDoTitleOutlet.text = titleText
        self.tvToDoDescriptionOutlet.text = detailedText
//        toDoDetaillabel.text = "\((detailedArray?.listArray)!) Developer"
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
