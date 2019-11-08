//
//  ShowRegisterViewController.swift
//  InOutRegister
//
//  Created by Raksha.Singh on 11/8/19.
//  Copyright © 2019 Raksha.Singh. All rights reserved.
//

import UIKit

class ShowRegisterViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableViewOutlet: UITableView!
    var inTimeShow:[String] = []
    var outTimeShow:[String] = []
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let a = section
        if section == 0 {
            return "In Time With Date"
        }
        if section == 1 {
            return "Out Time With Date"
        }
        return "\(a)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        if section == 0 {
            rowCount = inTimeShow.count
        }
        if section == 1 {
            rowCount = outTimeShow.count
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :  UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "registerCell", for: indexPath)
        cell.textLabel?.text = "\(inTimeShow[indexPath.row])"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(inTimeShow)
        print(outTimeShow)
//        let defaults = UserDefaults.standard
//        defaults.set(inTimeShow, forKey: "In")
//        defaults.set(outTimeShow, forKey: "Out")
    }
    
}
