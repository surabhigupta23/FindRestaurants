//
//  ViewController.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/21/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, BookTableDelegate {
    
    let restaurantCell = "RestuarantTableViewCell"
    var filteredArray = Array<Restaurant>()
    var dataModel = DataModel()
    var restaurants = Array<Restaurant>()
    var searchController = UISearchController(searchResultsController: nil)
    var bookingList = [Int:String]()
    let configureView = Configuration()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    private func registerNibs() {
        tableView.register(UINib(nibName: restaurantCell, bundle: nil), forCellReuseIdentifier: restaurantCell)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerNibs()
    }
    
    private func setUp() {
        configureTableView()
        configureSearchController()
        jsonParser()
    }
    
     private func configureSearchController() {
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func jsonParser () {
        let path = Bundle.main.path(forResource: "restaurants", ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        
        let jsonDecoder = JSONDecoder()
        do{
            dataModel = try jsonDecoder.decode(DataModel.self, from: jsonData! as Data)
            
        }catch
        {
            print("Error \(error.localizedDescription)")
        }
    }
    
    //MARK: Get the booking details from DetailsVC
    func getBookedDataDetails(_ restaurant: Restaurant, _ dateTime: String) {
        bookingList[restaurant.id] = dateTime
    }
    
}

