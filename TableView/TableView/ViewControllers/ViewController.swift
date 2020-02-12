//
//  ViewController.swift
//  TableView
//
//  Created by Raksha Singh on 14/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , UICollectionViewDataSource , UICollectionViewDelegate {
    
    var StateImages : Array<UIImage> = [UIImage(named: "AndhraPradesh.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! , UIImage(named: "Assam.jpg")! , UIImage(named: "Bihar.jpg")! , UIImage(named: "Chhattisgarh.jpg")! , UIImage(named: "Chhattisgarh.jpg")! , UIImage(named: "Chhattisgarh.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! , UIImage(named: "Goa.jpg")! , UIImage(named: "Gujarat.jpg")! , UIImage(named: "Haryana.jpg")! , UIImage(named: "HimachalPradesh.jpg")! , UIImage(named: "JammuandKashmir.jpg")! , UIImage(named: "Jharkhand.jpg")! , UIImage(named: "Karnataka.jpg")! , UIImage(named: "Kerala.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! , UIImage(named: "MadhyaPradesh.jpg")! , UIImage(named: "Maharashtra.jpg")! , UIImage(named: "Manipur.jpg")! , UIImage(named: "Meghalaya.jpg")! , UIImage(named: "Mizoram.jpg")! , UIImage(named: "Nagaland.jpg")! , UIImage(named: "Odisha.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! , UIImage(named: "Punjab.jpg")! , UIImage(named: "Rajasthan.jpg")! , UIImage(named: "Sikkim.jpg")! , UIImage(named: "TamilNadu.jpg")! , UIImage(named: "Telangana.jpg")! , UIImage(named: "Tripura.jpg")! , UIImage(named: "Uttarakhand.jpg")! , UIImage(named: "UttarPradesh.jpg")! , UIImage(named: "WestBengal.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! ]
    
    var SelectedKey : String = ""
    var SlectedImage : UIImage?
    var StateArray = Array<String>()
    var StateDistDict = [String : Array<String>]()
    var grid  = UserDefaults.standard.set(true, forKey: "grid")
    var list = UserDefaults.standard.set(true, forKey: "list")
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentChangeViewOutlet: UISegmentedControl!
    @IBAction func segmentChangeView(_ sender: Any) {
        
        switch segmentChangeViewOutlet.selectedSegmentIndex
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
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           if(segue.identifier == "districts") {
            let vc = segue.destination as! DistrictsViewController
            vc.key = SelectedKey
            vc.StateDistDictionary = StateDistDict
            vc.image = SlectedImage
            
           }
        if(segue.identifier == "places") {
            let vc = segue.destination as! DistrictsPlacesViewController
            vc.data = StateArray
            vc.imagedata = StateImages
//            vc.StateDistDictionary = StateDistDict
        }
       }
    
//    @objc func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
//
//        let longpress = gestureRecognizer as! UILongPressGestureRecognizer
//        let state = longpress.state
//        let locationInView = longpress.location(in: self.tableView)
//        let indexPath = self.tableView.indexPathForRow(at: locationInView)
//
//        switch state {
//        case .began:
//            //            self.performSegue(withIdentifier: "add", sender: self)
//            if indexPath != nil {
//                Path.initialIndexPath = indexPath
//                let cell = self.tableView.cellForRow(at: indexPath!) as! CustomCell
//
//                My.cellSnapShot = snapshopOfCell(inputView: cell)
//                var center = cell.center
//                My.cellSnapShot?.center = center
//                My.cellSnapShot?.alpha = 0.0
//                self.tableView.addSubview(My.cellSnapShot!)
//                UIView.animate(withDuration: 0.25, animations: {
//
//
//                    center.y = locationInView.y
//                    My.cellSnapShot?.center = center
//                    My.cellSnapShot?.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
//                    My.cellSnapShot?.alpha = 0.98
//                    cell.alpha = 0.0
//                }, completion: { (finished) -> Void in
//                    if finished {
//                        cell.isHidden = true
//                    }
//                })
//            }
//
//        case .changed:
//            var center = My.cellSnapShot?.center
//            center?.y = locationInView.y
//            My.cellSnapShot?.center = center!
//            if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
//
//                self.StateArray.swapAt((indexPath?.row)!, (Path.initialIndexPath?.row)!)
//                                swap(&self.tableArray[(indexPath?.row)!], &self.tableArray[(Path.initialIndexPath?.row)!])
//                self.tableView.moveRow(at: Path.initialIndexPath!, to: indexPath!)
//                Path.initialIndexPath = indexPath
//            }
//
//        default:
//            let cell = self.tableView.cellForRow(at: Path.initialIndexPath!) as! CustomCell
//            cell.isHidden = false
//            cell.alpha = 0.0
//            UIView.animate(withDuration: 0.25, animations: {
//                My.cellSnapShot?.center = cell.center
//                My.cellSnapShot?.transform = .identity
//                My.cellSnapShot?.alpha = 0.0
//                cell.alpha = 1.0
//            }, completion: { (finished) -> Void in
//                if finished {
//                    Path.initialIndexPath = nil
//                    My.cellSnapShot?.removeFromSuperview()
//                    My.cellSnapShot = nil
//                }
//            })
//        }
//    }
    
//    func snapshopOfCell(inputView: UIView) -> UIView {
//
//        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
//        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        let cellSnapshot : UIView = UIImageView(image: image)
//        cellSnapshot.layer.masksToBounds = false
//        cellSnapshot.layer.cornerRadius = 0.0
//        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
//        cellSnapshot.layer.shadowRadius = 5.0
//        cellSnapshot.layer.shadowOpacity = 3.0
//        return cellSnapshot
//    }
    
//    struct My {
//        static var cellSnapShot: UIView? = nil
//    }
//
//    struct Path {
//        static var initialIndexPath: IndexPath? = nil
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Segment
        segmentChangeViewOutlet.layer.cornerRadius = segmentChangeViewOutlet.frame.width / 11
        segmentChangeViewOutlet.layer.borderWidth = 2
        segmentChangeViewOutlet.layer.borderColor = UIColor.black.cgColor
        segmentChangeViewOutlet.clipsToBounds = true
        
        // TableView and collection View
//        tableView.layer.borderWidth = 2
        tableView.layer.borderColor = UIColor.systemBlue.cgColor
//        collectionView.layer.borderWidth = 2
        collectionView.layer.borderColor = UIColor.systemBlue.cgColor
        
            // For Segment to change view
        tableView.alpha = 1
        collectionView.alpha = 0
        
            // For Custom TableViewCell
        tableView.dataSource = self
        tableView.delegate = self
        let nibName = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "customcell")
        
        // Long Press Gesture and Drag
//        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureRecognized(gestureRecognizer:)))
//        self.tableView.addGestureRecognizer(longpress)
        
        
        // JSON Data Parsing
        TableData.downloadTabledata { jsonData in
            guard let jData = jsonData else {return}
            do {
                if let json = try JSONSerialization.jsonObject(with: jData, options: []) as? [String : Any] {
                    var count = 0
                    if let states = json["states"] as? Array<Dictionary<String, Any>> {
                        for state in states {
                            StateArray.append(state["state"] as! String)
                            if let dist = state["districts"] as? Array<String> {
                                StateDistDict.updateValue(dist, forKey: "\(StateArray[count])")
                                count += 1
                            }
                        }
                    }
                }
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
    
    // Table View Config
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return StateArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexth: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomCell
            cell.lbTextOnCellOutlet.text = "\(StateArray[indexPath.row])"
            cell.imageOutlet.image = StateImages[indexPath.row]
        cell.backgroundColor = .clear
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedKey = StateArray[indexPath.row]
        SlectedImage = StateImages[indexPath.row]
        self.performSegue(withIdentifier: "districts", sender: self)
    }
    
    // Collection View Config
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return StateArray.count
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let collectionCell: CollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! CollectionViewCell
        collectionCell.lblOutlet.text = StateArray[indexPath.row]
        collectionCell.imgOutlet.image = StateImages[indexPath.row]
        collectionCell.layer.cornerRadius = collectionCell.frame.width / 14
        collectionCell.layer.borderWidth = 2
        collectionCell.layer.borderColor = UIColor.black.cgColor
        collectionCell.clipsToBounds = true
        collectionCell.imgOutlet.layer.cornerRadius = collectionCell.imgOutlet.frame.width / 13
        collectionCell.imgOutlet.layer.borderWidth = 2
        collectionCell.imgOutlet.layer.borderColor = UIColor.black.cgColor
        
        return collectionCell
       }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        SelectedKey = StateArray[indexPath.row]
        SlectedImage = StateImages[indexPath.row]
        self.performSegue(withIdentifier: "districts", sender: self)
    }
}
