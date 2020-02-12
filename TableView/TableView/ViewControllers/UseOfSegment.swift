//
//  UseOfSegment.swift
//  TableView
//
//  Created by Raksha Singh on 04/02/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class UseOfSegment: UIViewController {
    
    var data = ["😀","👻","🦉","🐧","🐹","🐵","🦑","🤬","💦","🌚","🌗","🍎","🥨"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
    }
   

       
    
    // Table View Config
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
//        cell.textLabel?.text = data[indexPath.row]
//        return cell
//    }
    
    // Collection View Config
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let collectionCell: GridCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! GridCollectionViewCell
//        collectionCell.lblOutlet.text = data[indexPath.row]
//        return collectionCell
//    }

}
