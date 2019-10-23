//
//  ConfigurationFile.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/24/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import Foundation
import UIKit

class Configuration {
    
    //Constants
    let customDateFormat = "EEE, dd-MMM-yyyy \'at' hh:mm a"
    let title = "Booking done"
    let alertMsg = "Booking has been done for successfully for: "
    let ruppee = "₹"
    
    func getRatingBackgroundColor(_ restaurant: Restaurant) -> UIColor {
        if(restaurant.rating >= 3.5)
        {
            return UIColor.green
        }
        else
        {
            return UIColor.yellow
        }
    }
    
    func configureRatingView (_ view: UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5 // change this number to get the corners you want
    }
    
    func perPersonRateLabel(_ perPersonPrice: Int) -> String {
       return  ruppee +  String(perPersonPrice) + " per person"
        
    }
}
