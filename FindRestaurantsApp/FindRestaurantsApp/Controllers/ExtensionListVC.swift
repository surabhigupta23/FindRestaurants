//
//  ExtensionListVC.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/24/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import UIKit

//MARK: Configuring Search Controller
extension ListViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else { return }
        
        //get filtered data as per search
        filteredArray = restaurants.filter { (restaurants) -> Bool in return restaurants.name.lowercased().contains(text.lowercased()) }
        tableView.reloadData()
    }
}

//MARK: Configuring TableView
extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count < 1 ? dataModel.restaurants.count : filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: restaurantCell, for: indexPath) as! RestuarantTableViewCell
        restaurants = dataModel.restaurants
        var image = " "
        
        if filteredArray.count < 1 {
            image = restaurants[indexPath.row].imageURL
            cell.restaurantImageView.image = UIImage(named: image)
            cell.restaurantNameLabel.text = restaurants[indexPath.row].name
            cell.restaurantCuisineLabel.text = restaurants[indexPath.row].cuisines
            cell.ratingLabel.text = String(restaurants[indexPath.row].rating)
            cell.ratingView.backgroundColor = configureView.getRatingBackgroundColor(restaurants[indexPath.row])
            cell.restaurantPerPersonRateLabel.text = configureView.perPersonRateLabel(restaurants[indexPath.row].pricePerPerson)
            cell.etaLabel.text = String(restaurants[indexPath.row].eta) + "min"
        } else {
            image = filteredArray[indexPath.row].imageURL
            cell.restaurantImageView.image = UIImage(named: image)
            cell.restaurantNameLabel.text = filteredArray[indexPath.row].name
            cell.restaurantCuisineLabel.text = filteredArray[indexPath.row].cuisines
            cell.ratingLabel.text = String(filteredArray[indexPath.row].rating)
            cell.restaurantPerPersonRateLabel.text = configureView.perPersonRateLabel(filteredArray[indexPath.row].pricePerPerson)
            cell.etaLabel.text = String(filteredArray[indexPath.row].eta) + "min"
            cell.ratingView.backgroundColor = configureView.getRatingBackgroundColor(filteredArray[indexPath.row])
        }
        configureView.configureRatingView(cell.ratingView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        if filteredArray.count < 1 {
            if(bookingList.keys.contains(restaurants[indexPath.row].id)) {
                vc.bookedDateTime = bookingList[restaurants[indexPath.row].id]
                vc.isTableBooked = true
            }
            vc.restaurant = restaurants[indexPath.row]
        }
        else {
            if(bookingList.keys.contains(filteredArray[indexPath.row].id)) {
                vc.bookedDateTime = bookingList[filteredArray[indexPath.row].id]
                vc.isTableBooked = true
            }
            vc.restaurant = filteredArray[indexPath.row]
        }
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
