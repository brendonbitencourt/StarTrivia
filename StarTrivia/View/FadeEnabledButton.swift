//
//  FadeEnableButton.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-26.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import UIKit

class FadeEnabledButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                    self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                    self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
        }
    }
    
}
