//
//  ViewController.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-14.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import UIKit

class SelectPersonViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    let personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personAPI.getRandomPersonUrlSession { (person) in
            guard let person = person else { return }
            print(person)
        }
    }

}

