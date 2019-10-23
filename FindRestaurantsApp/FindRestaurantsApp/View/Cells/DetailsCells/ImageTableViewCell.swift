//
//  ImageTableViewCell.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/22/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
