//
//  ViewController.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-14.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import UIKit

class SelectPersonViewController: UIViewController {
    
    let personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personAPI.getRandomPersonUrlSession()
    }

}

