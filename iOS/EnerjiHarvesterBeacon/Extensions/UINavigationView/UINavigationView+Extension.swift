//
//  UINavigationView+Extension.swift
//  Maksmart
//
//  Created by Uygar İşiçelik on 3.07.2020.
//  Copyright © 2020 Uygar İŞİÇELİK. All rights reserved.
//

import Foundation
import UIKit


extension UINavigationController {

override open var shouldAutorotate: Bool {
    get {
        if let visibleVC = visibleViewController {
            return visibleVC.shouldAutorotate
        }
        return false
    }
}

override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
    get {
        if let visibleVC = visibleViewController {
            return visibleVC.preferredInterfaceOrientationForPresentation
        }
        return UIInterfaceOrientation.portrait
    }
}

override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
    get {
        if let visibleVC = visibleViewController {
            return visibleVC.supportedInterfaceOrientations
        }
        return UIInterfaceOrientationMask.portrait
    }
}

}
