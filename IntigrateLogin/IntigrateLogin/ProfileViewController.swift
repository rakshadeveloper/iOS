//
//  ProfileViewController.swift
//  IntigrateLogin
//
//  Created by Raksha Singh on 19/03/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var eMailIDOutlet: UILabel!
    @IBOutlet weak var userNameOutlet: UILabel!
    @IBOutlet weak var profilePhotoOutlet: UIImageView!
    var username:String?
    var email: String?
    var profileurl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Get Data From Fist ViewController
        userNameOutlet.text = username
        eMailIDOutlet.text = email
        
        // Get image URL and set
        let url = URL(string: profileurl!)
        let data = try? Data(contentsOf: url!)
        profilePhotoOutlet.image = UIImage(data: data!)
        
        // ImageView Rounded
        profilePhotoOutlet.layer.borderWidth = 1.0
//        profilePhotoOutlet.layer.borderColor = (UIColor.init(cgColor: UIColor.white as! CGColor) as! CGColor)
        profilePhotoOutlet.layer.cornerRadius = profilePhotoOutlet.frame.height / 2
    }
    
}
