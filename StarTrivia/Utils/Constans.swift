//
//  Constans.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-14.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import Foundation
import UIKit

struct Contants {
    static let BLACK_BG = UIColor.black.withAlphaComponent(0.7).cgColor
    static let URL_BASE = "https://swapi.co/api/"
    static let PERSON_URL = URL_BASE + "people/"
}

typealias PersonReponseCompletion = (PersonModel?) -> Void
