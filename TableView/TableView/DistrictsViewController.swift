//
//  DistrictsViewController.swift
//  TableView
//
//  Created by Raksha Singh on 29/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class DistrictsViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    var tableArray1 = Array<String>()
    
    // TableView DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableArray1[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableArray1 = ["\(tableArray1)"]
    }
}
