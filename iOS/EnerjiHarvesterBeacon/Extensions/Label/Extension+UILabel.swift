//
//  Extension+UILabel.swift
//  Maksmart
//
//  Created by meyer on 14.06.2019.
//  Copyright © 2019 Uygar ISICELIK. All rights reserved.
//

import UIKit

public extension UILabel {
    func setLocalizedMaksmartDescription(size: CGFloat) {
        let boldAttr = [NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: size)]
        let normalAttr = [NSAttributedString.Key.font: UIFont(name: "Roboto", size: size)]
        let desc_first = NSAttributedString(string:"maksmart_desc_first".localized() + " " , attributes: normalAttr as [NSAttributedString.Key : Any])
        let desc_second = NSAttributedString(string:"maksmart_desc_second".localized() + " " , attributes: boldAttr as [NSAttributedString.Key : Any])
        let desc_third = NSAttributedString(string:"maksmart_desc_third".localized() , attributes: normalAttr as [NSAttributedString.Key : Any])
        
        let desc = NSMutableAttributedString()
        desc.append(desc_first)
        desc.append(desc_second)
        desc.append(desc_third)
        
        self.attributedText = desc
    }
    
    func setEmptyRecord() {
        self.text = "no_record".localized()
        self.font = UIFont(name: "Roboto-Regular", size: 17)
        self.textColor = UIColor(rgb: 0x920c0c)
        self.textAlignment = NSTextAlignment.center
    }
    
    func setRounded() {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = true
    }
}
