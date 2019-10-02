//
//  HomewordViewController.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-29.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import UIKit

class HomewordViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var terrainLabel: UILabel!
    @IBOutlet weak var populateLabel: UILabel!
    
    var person: PersonModel?
    let api = HomewordAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = person?.homeworldUrl {
            api.getHomewordAlamofireAndCodable(url: url) { (homeword) in
                guard let homeword = homeword else { return }
                self.setupView(homeword)
            }
        }
    }
    
    func setupView(_ homeword: HomewordModel) {
        nameLabel.text = homeword.name
        climateLabel.text = homeword.climate
        terrainLabel.text = homeword.terrain
        populateLabel.text = homeword.population
    }

}
