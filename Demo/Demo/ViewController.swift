//
//  ViewController.swift
//  Demo
//
//  Created by Raksha Singh on 30/12/19.
//  Copyright © 2019 Raksha Singh. All rights reserved.
//

import UIKit
import ContactsUI
import Contacts
import Foundation
import _SwiftUIKitOverlayShims
import MapKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate  {
    
    fileprivate let application = UIApplication.shared
    var key : [String] = []
    var value : [String] = []
    var Name: [String] = []
    var Number: [String] = []
    var filterName: [String] = []
    var filterNumber: [String] = []
    var contactDict: [String : String] = [:]
    var filter: [String : String] = [:]
    
    @IBOutlet weak var btnDeleteOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfNumberOutlet: UITextField!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnLongPressed: UIButton!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var btnHash: UIButton!
    @IBOutlet weak var btnCall: UIButton!
    
    // Table View To Show Related Contcts
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if  (filterNumber.count == 0) {
            return key.count
        } else {
            return self.filterNumber.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if (filterNumber.count == 0) {
            key = [Array(self.contactDict.keys)[indexPath.row]]
            value = [Array(self.contactDict.values)[indexPath.row]]
            cell.textLabel?.text = "\(key) \(value)"
            return cell
        }
        else {
            cell.textLabel?.text = "\(self.filterNumber[indexPath.row]) \(Name[indexPath.row])"
            return cell
        }
    }
    
    // Text Fields To Enter/Edit Numbers In Text Fields
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if(textField.text!.count > 0 ){
//            self.filterNumber.removeAll()
//            for contact in self.Number {
//                if(contact.starts(with:(textField.text!))) {
//                    self.filterNumber.append(contact)
//                }
//            }
//            self.tableView.reloadData()
//        }
//        else{
//            self.filterNumber = Number
//        }
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tfNumberOutlet.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField.text!.count > 0 ){
            self.filterNumber.removeAll()
            for contact in self.Number {
                if(contact.starts(with:(textField.text!))) {
                    self.filterNumber.append(contact)
                }
            }
            self.tableView.reloadData()
        }
        else{
            self.filterNumber = Number
        }
        self.tfNumberOutlet.delegate = self
        self.tableView.reloadData()
    }
    
    // Buttons  To Perform Action and Gestures
    
    @IBAction func btnLongPressed(_ sender: Any) {
        unHideButton ()
        tfNumberOutlet.text! += "0"
    }
    
    @IBAction func longPressedAction(_ sender: UILongPressGestureRecognizer) {
        unHideButton ()
        if sender.state == .ended {
            tfNumberOutlet.text! += "+"
        }
    }
    @IBAction func btnCallAction(_ sender: Any) {
        if let callURL = URL(string: "\(tfNumberOutlet.text ?? "")") {
            if application.canOpenURL(callURL){
                application.open(callURL, options: [:], completionHandler: nil)
            }
            else {
                let alert = UIAlertController(title: "Phone Call Action", message: "Call not Avilable \(callURL)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    @IBAction func btnDeleteAction(_ sender: Any) {
        let text = tfNumberOutlet.text
        
        if (text!.isEmpty) {
            hideButton ()
        }
        else {
            tfNumberOutlet.text = String(text!.dropLast())
            unHideButton ()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func DeleteAllAction(_ sender: UILongPressGestureRecognizer) {
        tfNumberOutlet.text?.removeAll()
        hideButton()
    }
    
    @IBAction func btnAction(_ sender: Any) {
        unHideButton ()
        
        print((sender as AnyObject).tag!)
        if (sender as AnyObject).tag == 1 {
            tfNumberOutlet.text! += "1"
            self.tableView.reloadData()
        }
        if (sender as AnyObject).tag == 2 {
            tfNumberOutlet.text! += "2"
            self.tableView.reloadData()
        }
        if (sender as AnyObject).tag == 3 {
            tfNumberOutlet.text! += "3"
        }
        if (sender as AnyObject).tag == 4 {
            tfNumberOutlet.text! += "4"
        }
        if (sender as AnyObject).tag == 5 {
            tfNumberOutlet.text! += "5"
        }
        if (sender as AnyObject).tag == 6 {
            tfNumberOutlet.text! += "6"
        }
        if (sender as AnyObject).tag == 7 {
            tfNumberOutlet.text! += "7"
        }
        if (sender as AnyObject).tag == 8 {
            tfNumberOutlet.text! += "8"
        }
        if (sender as AnyObject).tag == 9 {
            tfNumberOutlet.text! += "9"
        }
        if (sender as AnyObject).tag == 11 {
            tfNumberOutlet.text! += "*"
        }
        if (sender as AnyObject).tag == 12 {
            tfNumberOutlet.text! += "#"
        }
    }
    
    // Functions With Definations
    
    // Hide and Unhide Function
    func hideButton () {
        btnDeleteOutlet.isHidden = true
    }
    func unHideButton () {
        btnDeleteOutlet.isHidden = false
    }
    // Getting Contacts From Phonebook Function
    
    private func fetchContacts () {
        print("Attempting contacts")
        
        let store = CNContactStore()
        
        // Get Access For Contacts
        
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Fail to request", err)
                return
            }
            if granted
            {
                // Store Contacts in Dictionary and Arry
                print("Access Granted...")
                let keys = [CNContactGivenNameKey , CNContactPhoneNumbersKey , CNContactFamilyNameKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    try store.enumerateContacts(with: request, usingBlock:  { (contact, stopPointerIfYouWantToStopEnumeration) in
                        
                        self.Name.append(contact.givenName)
                        self.contactDict.updateValue(contact.givenName, forKey: "name")
                        self.contactDict.updateValue(contact.phoneNumbers.first?.value.stringValue ?? "", forKey: "number")
                        self.Number.append(contact.phoneNumbers.first?.value.stringValue ?? "")
                        //                        print(contact.givenName)
                        //                        print(contact.familyName)
                        //                        print(contact.phoneNumbers.first?.value.stringValue ?? "")
                        self.filterName = self.Name
                        //                        print(self.Name)
                        print(self.contactDict)
                        //                        print(self.Number)
                    })
                } catch let err {
                    print("Fail to enumrt", err)
                }
                
            } else {
                print("Access Denied....")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Additional setup after loading the view.
        
        textFieldDidBeginEditing(tfNumberOutlet)
        fetchContacts ()
        hideButton()
        unHideButton()
        tableView.reloadData()
        btnDeleteOutlet.isHidden = true
        
        // Give UI Elements Shape to Circle.
        
        btn1.layer.cornerRadius = btn1.frame.size.width / 2
        btn2.layer.cornerRadius = btn2.frame.size.width / 2
        btn3.layer.cornerRadius = btn3.frame.size.width / 2
        btn4.layer.cornerRadius = btn4.frame.size.width / 2
        btn5.layer.cornerRadius = btn5.frame.size.width / 2
        btn6.layer.cornerRadius = btn6.frame.size.width / 2
        btn7.layer.cornerRadius = btn7.frame.size.width / 2
        btn8.layer.cornerRadius = btn8.frame.size.width / 2
        btn9.layer.cornerRadius = btn9.frame.size.width / 2
        btnLongPressed.layer.cornerRadius = btnLongPressed.frame.size.width / 2
        btnStar.layer.cornerRadius = btnStar.frame.size.width / 2
        btnHash.layer.cornerRadius = btnHash.frame.size.width / 2
        btnCall.layer.cornerRadius = btnCall.frame.size.width / 2
        
        }
}

