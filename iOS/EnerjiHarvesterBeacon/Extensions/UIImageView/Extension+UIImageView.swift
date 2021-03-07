//
//  Extension+UIImageView.swift
//  Maksmart
//
//  Created by meyer on 19.06.2019.
//  Copyright © 2019 Uygar ISICELIK. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setRounded() {
        self.contentMode = .scaleAspectFill
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    @IBInspectable var imageColor: UIColor! {
        set {
            super.tintColor = newValue
        }
        get {
            return super.tintColor
        }
    }
}
