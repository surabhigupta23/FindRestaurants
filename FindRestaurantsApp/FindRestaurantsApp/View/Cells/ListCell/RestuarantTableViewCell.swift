//
//  RestuarantTableViewCell.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/21/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import UIKit

class RestuarantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantCuisineLabel: UILabel!
    @IBOutlet weak var restaurantPerPersonRateLabel: UILabel!
    @IBOutlet weak var etaLabel: UILabel!
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
