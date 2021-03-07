//
//  Extension+UIViewController.swift
//  maksmart Admin
//
//  Created by meyer on 15.06.2019.
//  Copyright © 2019 Uygar ISICELIK. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setMaksmartTheme(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "primaryColor")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 255, green: 255, blue: 255)]
    }
    
    func setMaksmartHeader() {
        let title = self.getmaksmartLabel()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: title)
    }
    
    func setHeader(title: String) {
        let title = self.getLabel(text: title)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: title)
    }
    
    func setTitleCenter(title: String) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : UIColor.white,
             NSAttributedString.Key.font: UIFont(name: "Roboto", size: 18)!]
        self.navigationItem.title = title
    }
    
    func setMaksmartHeaderCenter() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : UIColor.white,
             NSAttributedString.Key.font: UIFont(name: "Roboto", size: 25)!]
        self.navigationItem.title = "maksmart"
    }
    
    func getmaksmartLabel() -> UILabel {
        let label = UILabel()
        label.text = "maksmart"
        label.textColor = .white
        label.font = UIFont(name: "Roboto", size: 35)
        label.textAlignment = .left
        return label
    }
    
    func getLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont(name: "Roboto", size: 24)
        label.textAlignment = .left
        return label
    }
    
    func performSegueAsync(withIdentifier identifier: String, sender: Any?) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: identifier, sender: sender)
        }
    }
    
    func getPopUpViewController(storyboardIdentifier: String, rootViewContoller: UIViewController?) -> UIViewController {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: storyboardIdentifier)
        viewController?.view.center = CGPoint(x: UIScreen.main.bounds.size.width * 0.5, y: UIScreen.main.bounds.size.height * 0.5)
        self.addChild(viewController!)
        
        //        if let rootViewController = rootViewContoller {
        //            viewController!.view.frame = rootViewController.view.frame
        //        } else {
        //            viewController!.view.frame = self.view.frame
        //        }
        
        self.view.addSubview(viewController!.view)
        if let rootViewController = rootViewContoller {
            viewController?.didMove(toParent: rootViewController)
        } else {
            viewController?.didMove(toParent: self)
        }
        
        return viewController!
    }
    
    func showPopUpWithAnimation() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removePopUpWithAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        },completion: {(finished : Bool) in
            if(finished) {
                self.view.removeFromSuperview()
            }
        })
    }
    
    func setupTapGestureForView(for view: UIView, selector: Selector, _ withTag: Int?) {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: selector)
        if let tag = withTag { view.tag = tag }
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func setupLongTapGestureForView(for view:UIView, withTag:Int? = 0, selector: Selector) {
        let longTapRecognizer = UILongPressGestureRecognizer(target: self, action: selector)
        if let tag = withTag { view.tag = tag }
        view.addGestureRecognizer(longTapRecognizer)
    }
}
