//
//  ViewController.swift
//  TableView
//
//  Created by Raksha Singh on 14/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

struct places {
    var opened = Bool()
    var states = [String]()
    var dist = [String]()
}

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    var StateImages : Array<UIImage> = [UIImage(named: "AndhraPradesh.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! , UIImage(named: "Assam.jpg")! , UIImage(named: "Bihar.jpg")! , UIImage(named: "Chhattisgarh.jpg")! , UIImage(named: "Chhattisgarh.jpg")! , UIImage(named: "Chhattisgarh.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! , UIImage(named: "Goa.jpg")! , UIImage(named: "Gujarat.jpg")! , UIImage(named: "Haryana.jpg")! , UIImage(named: "HimachalPradesh.jpg")! , UIImage(named: "JammuandKashmir.jpg")! , UIImage(named: "Jharkhand.jpg")! , UIImage(named: "Karnataka.jpg")! , UIImage(named: "Kerala.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! , UIImage(named: "MadhyaPradesh.jpg")! , UIImage(named: "Maharashtra.jpg")! , UIImage(named: "Manipur.jpg")! , UIImage(named: "Meghalaya.jpg")! , UIImage(named: "Mizoram.jpg")! , UIImage(named: "Nagaland.jpg")! , UIImage(named: "Odisha.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! , UIImage(named: "Punjab.jpg")! , UIImage(named: "Rajasthan.jpg")! , UIImage(named: "Sikkim.jpg")! , UIImage(named: "TamilNadu.jpg")! , UIImage(named: "Telangana.jpg")! , UIImage(named: "Tripura.jpg")! , UIImage(named: "Uttarakhand.jpg")! , UIImage(named: "UttarPradesh.jpg")! , UIImage(named: "WestBengal.jpg")! , UIImage(named: "ArunachalPradesh.jpg")! ]
    var SelectedKey : String = ""
    var cityArray = [places]()
    var StateArray = Array<String>()
    var arr = [String : Array<String>]()
//    var arrdata = [State]()
        var tableArray = ["Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine"]
    
    //    @IBOutlet weak var favouritsView: UIView!
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if StateArray.count != 0 {
             return StateArray.count
        }
        else {
            return tableArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexth: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if StateArray.count != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomCell
            cell.lbTextOnCellOutlet.text = "\(indexPath.row) \(StateArray[indexPath.row])"
            cell.imageOutlet.image = StateImages[indexPath.row]
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomCell
            cell.lbTextOnCellOutlet.text = tableArray[indexPath.row]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedKey = StateArray[indexPath.row]
        self.performSegue(withIdentifier: "districts", sender: self)
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           if(segue.identifier == "districts") {
            let vc = segue.destination as! DistrictsViewController
            vc.key = SelectedKey
            vc.tableArray1 = arr
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
        // Do any additional setup after loading the view.
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
//                            print(state["state"]!)
//                            StateArray.removeAll()
                            StateArray.append(state["state"] as! String)
                            if let dist = state["districts"] as? Array<String> {
//                                print(dist)
                                arr.updateValue(["\(dist)"], forKey: "\(StateArray[count])")
                                count += 1
                            }
                        }
//                        print(arr)
                    }
                }
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
}
