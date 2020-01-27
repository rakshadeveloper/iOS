//
//  ViewController.swift
//  TableView
//
//  Created by Raksha Singh on 14/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit
class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    var array = Array<String>()
    var arrdata = [State]()
    //    var tableArray = ["Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine", "Chesapeake","Albemarle", "Brandywine"]
    
    //    @IBOutlet weak var favouritsView: UIView!
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexth: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomCell
        cell.lbTextOnCellOutlet.text = array[indexPath.row]
        return cell
    }
    
    @objc func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
        
        let longpress = gestureRecognizer as! UILongPressGestureRecognizer
        let state = longpress.state
        let locationInView = longpress.location(in: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: locationInView)
        
        switch state {
        case .began:
            //            self.performSegue(withIdentifier: "add", sender: self)
            if indexPath != nil {
                Path.initialIndexPath = indexPath
                let cell = self.tableView.cellForRow(at: indexPath!) as! CustomCell
                
                My.cellSnapShot = snapshopOfCell(inputView: cell)
                var center = cell.center
                My.cellSnapShot?.center = center
                My.cellSnapShot?.alpha = 0.0
                self.tableView.addSubview(My.cellSnapShot!)
                UIView.animate(withDuration: 0.25, animations: {
                    
                    
                    center.y = locationInView.y
                    My.cellSnapShot?.center = center
                    My.cellSnapShot?.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                    My.cellSnapShot?.alpha = 0.98
                    cell.alpha = 0.0
                }, completion: { (finished) -> Void in
                    if finished {
                        cell.isHidden = true
                    }
                })
            }
            
        case .changed:
            var center = My.cellSnapShot?.center
            center?.y = locationInView.y
            My.cellSnapShot?.center = center!
            if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
                
                self.array.swapAt((indexPath?.row)!, (Path.initialIndexPath?.row)!)
                //                swap(&self.tableArray[(indexPath?.row)!], &self.tableArray[(Path.initialIndexPath?.row)!])
                self.tableView.moveRow(at: Path.initialIndexPath!, to: indexPath!)
                Path.initialIndexPath = indexPath
            }
            
        default:
            let cell = self.tableView.cellForRow(at: Path.initialIndexPath!) as! CustomCell
            cell.isHidden = false
            cell.alpha = 0.0
            UIView.animate(withDuration: 0.25, animations: {
                My.cellSnapShot?.center = cell.center
                My.cellSnapShot?.transform = .identity
                My.cellSnapShot?.alpha = 0.0
                cell.alpha = 1.0
            }, completion: { (finished) -> Void in
                if finished {
                    Path.initialIndexPath = nil
                    My.cellSnapShot?.removeFromSuperview()
                    My.cellSnapShot = nil
                }
            })
        }
    }
    
    func snapshopOfCell(inputView: UIView) -> UIView {
        
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 3.0
        return cellSnapshot
    }
    
    struct My {
        static var cellSnapShot: UIView? = nil
    }
    
    struct Path {
        static var initialIndexPath: IndexPath? = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        let nibName = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "customcell")
        
        // Long Press Gesture and Drag
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureRecognized(gestureRecognizer:)))
        self.tableView.addGestureRecognizer(longpress)
        
        
        // JSON Data Parsing
        TableData.downloadTabledata { jsonData in
            guard let jData = jsonData else {return}
            do {
                if let json = try JSONSerialization.jsonObject(with: jData, options: []) as? [String : Any] {
//                    print(json)
                   
                    if let st = json["states"] as? Array<Dictionary<String, String>> {
                        for state in st {
                            print(state["state"]! )
                        }
                    }
                }
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
}
