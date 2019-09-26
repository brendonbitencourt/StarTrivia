//
//  PersonModel.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-24.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import Foundation

struct PersonModel: Codable {
    
    let name: String
    let height: String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeworldUrl: String
    let filmsUrls: [String]
    let vehiclesUrls: [String]
    let starshipsUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender = "gender"
        case homeworldUrl = "homeworld"
        case filmsUrls = "films"
        case vehiclesUrls = "vehicles"
        case starshipsUrls = "starships"
    }
    
}
