//
//  DistrictsViewController.swift
//  TableView
//
//  Created by Raksha Singh on 29/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class DistrictsViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    var tableArray1 = [String : Array<String>]()
    var ArrayDist = Array<String>()
    var key : String = ""
    
    // TableView DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ArrayDist.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = ArrayDist[indexPath.row]
        cell.textLabel?.text = "hi"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print(key)
        print(tableArray1)
    }
}
