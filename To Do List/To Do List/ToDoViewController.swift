//
//  ViewController.swift
//  To Do List
//
//  Created by Raksha Singh on 17/10/19.
//  Copyright © 2019 Raksha Singh. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    @IBAction func addToDoDetailButton(_ sender: Any) {
//        performSegue(withIdentifier: "addToDoDetail", sender: self)
//    }
    var listArray = ["iOS","Android"]
    var listDetailArray = ["Abhishek","Sharma"]

    @IBAction func unwindWithSegue(_ segue: AddToDoDetailViewController) {

        performSegue(withIdentifier: "addToDoDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :  UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "todoItem", for: indexPath)
        cell.textLabel?.text = listArray[indexPath.row]
        cell.detailTextLabel?.text = listDetailArray[indexPath.row]
        
        return cell
    }
  
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.performSegue(withIdentifier: "editToDo", sender: nil)
        return indexPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
