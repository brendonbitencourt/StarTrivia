//
//  BlackBackgroundView.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-14.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import Foundation
import UIKit

class BlackBackgroundView: UIView {
    
    override func awakeFromNib() {
        self.layer.backgroundColor = Contants.BLACK_BG
        self.layer.cornerRadius = 10
    }
    
}

class BlackBackgroundButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.backgroundColor = Contants.BLACK_BG
        self.layer.cornerRadius = 10
    }
    
}
