//
//  Extension+UIApplication.swift
//  Maksmart
//
//  Created by Uygar İŞİÇELİK on 13.09.2019.
//  Copyright © 2019 Uygar ISICELIK. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public static var loggedUser: User?
    public static var activeOrganization: String?
    
    func systemSettingsForApplication() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(settingsUrl) { UIApplication.shared.open(settingsUrl, completionHandler: nil) }
    }
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
