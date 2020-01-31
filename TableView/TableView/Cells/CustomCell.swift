//
//  CustomCell.swift
//  TableView
//
//  Created by Raksha Singh on 14/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var lbTextOnCellOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imageOutlet.layer.cornerRadius = imageOutlet.frame.width / 15
        imageOutlet.layer.borderWidth = 2
        imageOutlet.layer.borderColor = UIColor.black.cgColor
        imageOutlet.clipsToBounds = true
        // Configure the view for the selected state
    }
    
}
