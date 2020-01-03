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
    var automaticallyShowsSearchResultsController: Bool = false
    var resultSearchController = UISearchController()
    var Name: [String] = []
    var Number: [String] = []
    var filterName: [String] = []
    var filterNumber: [String] = []
    var contactDict: [String : String] = [:]
    var filter: [String : String] = [:]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnPressedLong: UIButton!
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
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var btnHash: UIButton!
    @IBOutlet weak var btnCall: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        self.tfNumberOutlet.delegate = self
    }
    
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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
        
        return true
    }
    
    @IBAction func btnLongPressed(_ sender: Any) {
        
    }
    @IBAction func btnCallAction(_ sender: Any) {
        if let callURL = URL(string: "tel://0123456789") {
            if application.canOpenURL(callURL){
                application.open(callURL, options: [:], completionHandler: nil)
            }
            else {
                //alert
            }
            
        }
    }
    
    
    @IBAction func btnDeleteAction(_ sender: Any) {
        if (tfNumberOutlet.text == nil) {
            
        } else {
            if let text = tfNumberOutlet.text {
                tfNumberOutlet.text = String(text.dropLast())
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func btnAction(_ sender: Any) {
        print((sender as AnyObject).tag!)
        if (sender as AnyObject).tag == 1 {
            tfNumberOutlet.text! += "1"
            tfNumberOutlet.returnKeyType = .done
            
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
    
    
    private func fetchContacts () {
        print("Attempting contacts")
        
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Fail to request", err)
                return
            }
            if granted
            {
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
        
        //        tfNumberOutlet.text! += txt
        fetchContacts ()
        
        btn1.layer.cornerRadius = btn1.frame.size.width / 2
        btn2.layer.cornerRadius = btn2.frame.size.width / 2
        btn3.layer.cornerRadius = btn3.frame.size.width / 2
        btn4.layer.cornerRadius = btn4.frame.size.width / 2
        btn5.layer.cornerRadius = btn5.frame.size.width / 2
        btn6.layer.cornerRadius = btn6.frame.size.width / 2
        btn7.layer.cornerRadius = btn7.frame.size.width / 2
        btn8.layer.cornerRadius = btn8.frame.size.width / 2
        btn9.layer.cornerRadius = btn9.frame.size.width / 2
        btn0.layer.cornerRadius = btn0.frame.size.width / 2
        btnStar.layer.cornerRadius = btnStar.frame.size.width / 2
        btnHash.layer.cornerRadius = btnHash.frame.size.width / 2
        btnCall.layer.cornerRadius = btnCall.frame.size.width / 2
        
        tableView.reloadData()
//        tfNumberOutlet.delegate = self
//        tfNumberOutlet.returnKeyType = .done
    }
}

