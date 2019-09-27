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
    @IBOutlet weak var homewordButton: UIButton!
    @IBOutlet weak var vehiclesButton: UIButton!
    @IBOutlet weak var starshipsButton: UIButton!
    @IBOutlet weak var filmsButton: UIButton!
    
    let personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomPressed(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personAPI.getRandomPersonAlamofireAndCodable(id: random) { (person) in
            guard let person = person else { return }
            self.setupView(person)
        }
    }
    
    func setupView(_ person: PersonModel) {
        nameLabel.text = person.name
        heightLabel.text = person.height
        massLabel.text = person.mass
        hairLabel.text = person.hair
        birthYearLabel.text = person.birthYear
        genderLabel.text = person.gender
        
        homewordButton.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesButton.isEnabled = !person.vehiclesUrls.isEmpty
        starshipsButton.isEnabled = !person.starshipsUrls.isEmpty
        filmsButton.isEnabled = !person.filmsUrls.isEmpty
    }
    
    @IBAction func homewordPressed(_ sender: Any) {
    }
    
    @IBAction func vehiclesPressed(_ sender: Any) {
    }
    
    @IBAction func starshipsPressed(_ sender: Any) {
    }
    
    @IBAction func filmsPressed(_ sender: Any) {
    }
    
}
