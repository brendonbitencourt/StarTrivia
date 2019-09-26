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
    }
    
    @IBAction func randomPressed(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personAPI.getRandomPersonAlamofireAndSwiftJSON(id: random) { (person) in
            guard let person = person else { return }
            self.nameLabel.text = person.name
            self.heightLabel.text = person.height
            self.massLabel.text = person.mass
            self.hairLabel.text = person.hair
            self.birthYearLabel.text = person.birthYear
            self.genderLabel.text = person.gender
        }
    }
    
}
