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
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    let personAPI = PersonAPI()
    var person: PersonModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadingActivityIndicator.isHidden = true
    }
    
    @IBAction func randomPressed(_ sender: Any) {
        let random = Int.random(in: 1...87)
        self.loadingActivityIndicator.isHidden = false
        self.loadingActivityIndicator.startAnimating()
        personAPI.getRandomPersonAlamofireAndCodable(id: random) { (person) in
            self.loadingActivityIndicator.stopAnimating()
            self.loadingActivityIndicator.isHidden = true
            guard let person = person else { return }
            self.setupView(person)
            self.person = person
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = self.person
        }
    }
    
}

protocol PersonProtocol {
    var person: PersonModel? { get set }
}
