//
//  ViewController.swift
//  To Do List
//
//  Created by Raksha Singh on 17/10/19.
//  Copyright © 2019 Raksha Singh. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ToDoViewController: UIViewController, UITableViewDataSource {
    
//    @IBAction func addToDoDetailButton(_ sender: Any) {
//        performSegue(withIdentifier: "addToDoDetail", sender: self)
//    }
    var listArray = ["1","2"]
    @IBAction func unwindWithSegue(_ segue: AddToDoDetailViewController) {

        performSegue(withIdentifier: "addToDoDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDo", for: indexPath)
//        let row = indexPath.row
//        cell.toDoDetailTextField?.text = table1Data[row]
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
}
