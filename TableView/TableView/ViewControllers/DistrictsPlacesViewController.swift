//
//  DistrictsPlacesViewController.swift
//  TableView
//
//  Created by Raksha Singh on 03/02/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class DistrictsPlacesViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
   
    @IBOutlet weak var collectionView: UICollectionView!
    var data = Array<String>()
    var imagedata = Array<UIImage>()
//    var SelectedKey : String = ""
//    var SlectedImage : UIImage?
//    var StateDistDictionary = [String : Array<String>]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell: CollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        collectionCell.lblOutlet.text = data[indexPath.row]
        collectionCell.imgOutlet.image = imagedata[indexPath.row]
        collectionCell.layer.cornerRadius = collectionCell.frame.width / 14
        collectionCell.layer.borderWidth = 2
        collectionCell.layer.borderColor = UIColor.black.cgColor
        collectionCell.clipsToBounds = true
        return collectionCell
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        SelectedKey = data[indexPath.row]
//        SlectedImage = imagedata[indexPath.row]
//        self.performSegue(withIdentifier: "districts", sender: self)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//              if(segue.identifier == "districts") {
//               let vc = segue.destination as! DistrictsViewController
//               vc.key = SelectedKey
//               vc.StateDistDictionary = StateDistDict
//               vc.image = SlectedImage
//
//              }
//          }
}
