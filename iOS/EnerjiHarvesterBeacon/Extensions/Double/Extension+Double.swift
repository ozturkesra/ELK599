//
//  Extension+Double.swift
//  Maksmart
//
//  Created by Uygar İşiçelik on 20.06.2020.
//  Copyright © 2020 Uygar İŞİÇELİK. All rights reserved.
//

import Foundation

extension Double {
    
    var floatingOneDigitRoundString:String {
        return String(format: "%.1f", self)
    }
    
    var floatingRoundString:String {
        return String(format: "%.0f", self)
    }
}

extension Float {
    var floatingOneDigitRoundString:String {
        return String(format: "%.1f", self)
    }
    
    var floatingRoundString:String {
        return String(format: "%.0f", self)
    }
}
