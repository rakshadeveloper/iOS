//
//  ViewController.swift
//  IntigrateLogin
//
//  Created by Raksha Singh on 18/03/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class ViewController: UIViewController {
    
    var token : String?
    var userName : Any?
    var eMail : Any?
    var profileURL : Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFBUserData()
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        let fbLoginManager : LoginManager = LoginManager()
        guard UserDefaults.standard.object(forKey: "Token") != nil else {
            if (token == nil) {
                fbLoginManager.logIn(permissions: ["email"], from: self) { (result, error) -> Void in
                    if (error == nil){
                        let fbloginresult : LoginManagerLoginResult = result!
                        // if user cancel the login
                        if (result?.isCancelled)!{
                            return
                        }
                        if(fbloginresult.grantedPermissions.contains("email"))
                        {
                            self.token = AccessToken.current?.tokenString
                            UserDefaults.standard.set(self.token, forKey: "Token")
                            self.token = AccessToken.current?.tokenString
                            self.getFBUserData()
                            self.performSegue(withIdentifier: "profile", sender: nil)
                        }
                    }
                }
            }
            return
        }
        
        self.performSegue(withIdentifier: "profile", sender: nil)
    }
    func getFBUserData(){
        if((AccessToken.current) != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                print(result!)
                if (error != nil){
                    //everything works print the user data
                    print("Error took place: \(error!)")
                }
                else if let userData = result as? [String:AnyObject] {

                    // Access user data
                    //Get UserName
                    let username = userData["name"] as? String
                    UserDefaults.standard.set(username, forKey: "userName")
                    self.userName = UserDefaults.standard.object(forKey: "userName")
                    
                    // Get E-mailID
                    let email = userData["email"] as? String
                    UserDefaults.standard.set(email, forKey: "email")
                    self.eMail = UserDefaults.standard.object(forKey: "email")
                    
                    // Get Profile URL
                    let profile = userData["picture"] as? Dictionary<String, Any>
                    let URL = profile!["data"] as? [String:AnyObject]
                    let url = URL!["url"] as? String
                    UserDefaults.standard.set(url, forKey: "url")
                    self.profileURL = UserDefaults.standard.object(forKey: "url")
                }
            })
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ProfileViewController
        {
            let vc = segue.destination as? ProfileViewController
            vc?.username = (userName as! String)
            vc?.email = (eMail as! String)
            vc?.profileurl = (profileURL as! String)
        }
    }
    
}

