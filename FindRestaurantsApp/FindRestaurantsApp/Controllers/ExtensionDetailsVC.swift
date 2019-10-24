//
//  Extensions.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/23/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import UIKit

//MARK: Configuring TableView
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0: let displayCell = tableView.dequeueReusableCell(withIdentifier: restaurantCells[0], for: indexPath) as! ImageTableViewCell
            let image = restaurant.imageURL
            displayCell.restaurantImageView.image = UIImage(named: image)
            cell = displayCell
        case 1: let displayCell = tableView.dequeueReusableCell(withIdentifier: restaurantCells[1], for: indexPath) as! DetailsTableViewCell
            displayCell.nameLabel.text = restaurant.name
            displayCell.cuisinesLabel.text = restaurant.cuisines
            displayCell.addressLabel.text = restaurant.address
            displayCell.ratingLabel.text = String(restaurant.rating)
            displayCell.ratingView.backgroundColor = configureView.getRatingBackgroundColor(restaurant)
            configureView.configureRatingView(displayCell.ratingView)
            cell = displayCell
        case 2: if (isTableBooked) {
            let displayCell = tableView.dequeueReusableCell(withIdentifier: restaurantCells[3], for: indexPath) as! BookingDetailsTableViewCell
            displayCell.dateTimeLabel.text = bookedDateTime!
            cell = displayCell
        } else {
            let displayCell = tableView.dequeueReusableCell(withIdentifier: restaurantCells[2], for: indexPath) as! BookTableViewCell
            displayCell.bookButton.addTarget(self, action: #selector(DetailsViewController.buttonTapped(_:)), for: .touchUpInside)
            cell = displayCell
            }
        default:
            print("default")
        }
        return cell
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        senderButton = sender
        configureDatePicker()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 1:
            return 75
        case 2:
            return 45
        default:
            return 70
        }
    }
}

