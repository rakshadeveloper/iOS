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

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate , UISearchResultsUpdating  {
    
//    let tableData = ["One", "Two", "Three","Twenty-One"]
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    var tableView = UITableView()
    var Name: [String] = []
    var Number: [String] = []
    open var automaticallyShowsSearchResultsController: Bool = true

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return Name.count
        if  (resultSearchController.isActive) {
            return filteredTableData.count
        } else {
            return Name.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if (resultSearchController.isActive) {
            cell.textLabel?.text = filteredTableData[indexPath.row]
            print(filteredTableData[indexPath.row])
            
            return cell
        }
        else {
            cell.textLabel?.text = "\(Name[indexPath.row]) \(Number[indexPath.row])"
            
            return cell
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)

        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (Name as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]

        self.tableView.reloadData()
    }
    
    open var minimumPressDuration: TimeInterval = 0.1
    
    @IBAction func btnLongPressed(_ sender: Any) {
        
    }
    
    @IBAction func btnAction(_ sender: Any) {
        print((sender as AnyObject).tag!)
        if (sender as AnyObject).tag == 1 {
            tfNumberOutlet.text! += "1"
        }
        if (sender as AnyObject).tag == 2 {
            tfNumberOutlet.text! += "2"
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
    
    @IBAction func btnCallAction(_ sender: Any) {
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
                        self.Number.append(contact.phoneNumbers.first?.value.stringValue ?? "")
                        //                        print(contact.givenName)
                        //                        print(contact.familyName)
                        //                        print(contact.phoneNumbers.first?.value.stringValue ?? "")
                        print(self.Name)
                        print(self.Number)
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
        
//        resultSearchController.searchResultsUpdater = self as! UISearchResultsUpdating
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            tableView.tableHeaderView = controller.searchBar

            return controller
        })()

        // Reload the table
        tableView.reloadData()
        
    }
}
