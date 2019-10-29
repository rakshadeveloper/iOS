//
//  ViewController.swift
//  Emotion
//
//  Created by Raksha.Singh on 10/25/19.
//  Copyright © 2019 Raksha.Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var emojies = ["sad","happy","rude","love","heart"]
    var emojiesDetail = ["showing sorrow","showing pleasure","bad-mannered","romantic comedy","is a muscular organ"]
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :  UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "emotion", for: indexPath)
        cell.textLabel?.text = emojies[indexPath.row]
        cell.detailTextLabel?.text = emojiesDetail[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "emoji", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

