//
//  UseOfSegment.swift
//  TableView
//
//  Created by Raksha Singh on 04/02/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class UseOfSegment: UIViewController , UITableViewDelegate,UITableViewDataSource ,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var data = ["😀","👻","🦉","🐧","🐹","🐵","🦑","🤬","💦","🌚","🌗","🍎","🥨"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.alpha = 1
        collectionView.alpha = 0
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            tableView.alpha = 1
            collectionView.alpha = 0
        case 1:
            tableView.alpha = 0
            collectionView.alpha = 1
        default:
            break
        }
    }
    
    // Table View Config
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    // Collection View Config
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell: GridCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! GridCollectionViewCell
        collectionCell.lblOutlet.text = data[indexPath.row]
        return collectionCell
    }
}
