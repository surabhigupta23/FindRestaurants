//
//  ResturantsModel.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/22/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import Foundation
// MARK: - Welcome
struct DataModel: Codable {
    let status: String
    let restaurants: [Restaurant]
    
    init() {
        status = "Success"
        restaurants = [Restaurant]()
    }
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let name: String
    let cuisines: String
    let pricePerPerson: Int
    let eta: Int
    let rating: Double
    let address: String
    let imageURL: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case name, cuisines, pricePerPerson, eta, rating, address, id
        case imageURL = "imageUrl"
    }
    init() {
        name = " "
        cuisines = " "
        pricePerPerson = 0
        eta = 0
        rating = 0.0
        address = " "
        imageURL = " "
        id = 0
    }
}
