//
//  Extension+UITextField.swift
//  Maksmart
//
//  Created by meyer on 20.06.2019.
//  Copyright © 2019 Uygar ISICELIK. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func underlineWithIcon(underlineColor: UIColor, rightViewTint: UIColor, rightViewIconName: String){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = underlineColor.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        rightViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 7))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: rightViewIconName)
        imageView.tintColor = rightViewTint
        rightView = imageView
    }
    
    func addIcon(leftViewIconName: String, leftViewTint: UIColor){
        leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: leftViewIconName)
        imageView.tintColor = leftViewTint
        leftView = imageView
    }
    
    func addIcon(rightViewIconName: String, leftViewTint: UIColor){
        rightViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 8))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: rightViewIconName)
        imageView.tintColor = leftViewTint
        rightView = imageView
    }
}

