//
//  Extension+UIImage.swift
//  Maksmart
//
//  Created by meyer on 19.06.2019.
//  Copyright © 2019 Uygar ISICELIK. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func toString() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
