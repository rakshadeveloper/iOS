//
//  DistrictsViewController.swift
//  TableView
//
//  Created by Raksha Singh on 29/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class DistrictsViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , UICollectionViewDataSource , UICollectionViewDelegate {
   
    var StateDistDictionary = [String : Array<String>]()
    var ArrayDist = Array<String>()
    var key : String!
    var image : UIImage?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentChangeViewOutlet: UISegmentedControl!
    @IBOutlet weak var tableViewDist: UITableView!
    
    @IBAction func segmentChangeView(_ sender: Any) {
       switch segmentChangeViewOutlet.selectedSegmentIndex
        {
        case 0:
            tableViewDist.alpha = 1
            collectionView.alpha = 0
        case 1:
            tableViewDist.alpha = 0
            collectionView.alpha = 1
        default:
            break
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableViewDist.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDist.alpha = 1
        collectionView.alpha = 0
        collectionView.backgroundView = UIImageView(image: image!)

        // Set NavigationBar Title
        navigationItem.title = key
        
        // TableView Custom Cell
        tableViewDist.backgroundView = UIImageView(image: image!)
        tableViewDist.dataSource = self
        tableViewDist.delegate = self
        let nibName = UINib(nibName: "CustomCell", bundle: nil)
        tableViewDist.register(nibName, forCellReuseIdentifier: "customcell")
        
        // Collect Districts From Dictionary using key
        let count = StateDistDictionary["\(key!)"]!
        for Districts in  count {
            ArrayDist.append(Districts)
        }
    }
    // TableView DataSource and Delegate
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ArrayDist.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexth: IndexPath) -> CGFloat {
            return 180
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomCell
            cell.lbTextOnCellOutlet.text = ArrayDist[indexPath.row]
    //        cell.imageOutlet.image = image!
            cell.backgroundColor = .clear
            return cell
        }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        self.performSegue(withIdentifier: "places", sender: nil)
    //    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrayDist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let collectionCell: DistrictsCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! DistrictsCollectionViewCell
        collectionCell.lblDistrictsOutlet.text = ArrayDist[indexPath.row]
        collectionCell.backgroundColor = .clear
        return collectionCell
    }
}
