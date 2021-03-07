//
//  Extension+UIButton.swift
//  Maksmart
//
//  Created by Uygar İşiçelik on 10.08.2020.
//  Copyright © 2020 Uygar İŞİÇELİK. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func underline() {
        let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Roboto", size: 14),
        .foregroundColor: UIColor.systemGray,
        .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "forgot_password".localized(),
        attributes: yourAttributes)
        self.setAttributedTitle(attributeString, for: .normal)
    }
    
}
