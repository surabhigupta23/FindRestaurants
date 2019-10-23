//
//  DetailsTableViewCell.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/22/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cuisinesLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
