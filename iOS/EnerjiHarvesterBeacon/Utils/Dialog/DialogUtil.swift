//
//  DialogUtil.swift
//  EnerjiHarvesterBeacon
//
//  Created by Esra ÖZTÜRK on 24.01.2021.
//

import Foundation
import UIKit
import MaterialComponents
import MaterialComponents.MaterialDialogs_Theming
import SCLAlertView

public class DialogUtil {
    
    static func showDialog(viewController: UIViewController, title:String, message:String) -> MDCAlertController {
        let alertController = MDCAlertController(title: title, message: message)
        alertController.titleColor = UIColor.red
        alertController.titleAlignment = .left
        alertController.mdc_dialogPresentationController?.dismissOnBackgroundTap = true
        alertController.titleFont = UIFont(name: "PaytoneOne-Regular", size: 18.0)
        alertController.messageFont = UIFont(name: "Roboto-Regular", size: 13.0)
        alertController.backgroundColor = UIColor(red: 253, green: 253, blue: 253)
        alertController.cornerRadius = 3
        viewController.present(alertController, animated: true, completion: nil )
        return alertController
    }
    
    static func showDialog(viewController: UIViewController, title:String, message:String, buttonTitle: String  , completion: @escaping (DialogResult<Bool>) -> Void) {
        DispatchQueue.main.async {
            let alertController = MDCAlertController(title: title, message: message)
            alertController.titleColor = UIColor.red
            alertController.titleAlignment = .left
            alertController.mdc_dialogPresentationController?.dismissOnBackgroundTap = true
            alertController.titleFont = UIFont(name: "PaytoneOne-Regular", size: 18.0)
            alertController.messageFont = UIFont(name: "Roboto-Regular", size: 13.0)
            alertController.backgroundColor = UIColor(red: 253, green: 253, blue: 253)
            alertController.cornerRadius = 3
            let action = MDCAlertAction(title:buttonTitle) {
                (action) in
                completion(.success(true))
            }
            alertController.addAction(action)
            viewController.present(alertController, animated: true, completion: nil )
        }
    }
    
    static func showDialog(viewController: UIViewController, title:String, message:String, confirmButtonTitle: String, cancelButtonTitle: String  , completion: @escaping (DialogResult<Bool>) -> Void) {
        DispatchQueue.main.async {
            let alertController = MDCAlertController(title: title, message: message)
            alertController.titleColor = UIColor.red
            alertController.titleAlignment = .left
            alertController.mdc_dialogPresentationController?.dismissOnBackgroundTap = true
            alertController.titleFont = UIFont(name: "PaytoneOne-Regular", size: 18.0)
            alertController.messageFont = UIFont(name: "Roboto-Regular", size: 13.0)
            alertController.backgroundColor = UIColor(red: 253, green: 253, blue: 253)
            alertController.cornerRadius = 3
            
            let confirmAction = MDCAlertAction(title:confirmButtonTitle) {
                (action) in
                completion(.success(true))
            }
            
            let cancelAction = MDCAlertAction(title: cancelButtonTitle) {
                (action) in
                completion(.success(false))
            }
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)

            viewController.present(alertController, animated: true, completion: nil )
        }
    }
    
    static func showAlertWithTextField(viewController: UIViewController, okButtonTitle: String , cancelButtonTitle: String?,textFieldPlaceholder: String,title: String, subTitle: String,completion: @escaping (DialogResult<String>) -> Void) {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        
        let textField = alertView.addTextField(textFieldPlaceholder)
        alertView.addButton(okButtonTitle, action: { completion(.success(textField.text ?? "")) })
        if let cancelButtonTitle = cancelButtonTitle { alertView.addButton(cancelButtonTitle, action: {})}
        alertView.showSuccess(title, subTitle: subTitle)
    }
    
    static func showErrorWithTextField(viewController: UIViewController, okButtonTitle: String , cancelButtonTitle: String?,textFieldPlaceholder: String,title: String, subTitle: String,completion: @escaping (DialogResult<String>) -> Void) {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        
        let textField = alertView.addTextField(textFieldPlaceholder)
        alertView.addButton(okButtonTitle, action: { completion(.success(textField.text ?? "")) })
        if let cancelButtonTitle = cancelButtonTitle { alertView.addButton(cancelButtonTitle, action: {})}
        alertView.showError(title, subTitle: subTitle)
    }
    
    
    static func showAppInfo(viewController: UIViewController, title:String, message:String, buttonTitle: String  , completion: @escaping (DialogResult<Bool>) -> Void) {
        let alertController = MDCAlertController(title: title, message: message)
        alertController.titleColor = UIColor.black
        //alertController.titleIcon = UIImage(named: "AppIcon")
        alertController.titleAlignment = .left
        alertController.mdc_dialogPresentationController?.dismissOnBackgroundTap = true
        alertController.titleFont = UIFont(name: "Roboto", size: 24.0)
        alertController.messageFont = UIFont(name: "Roboto-Regular", size: 13.0)
        alertController.backgroundColor = UIColor(red: 253, green: 253, blue: 253)
        alertController.cornerRadius = 3
        let action = MDCAlertAction(title:buttonTitle) {
            (action) in
            completion(.success(true))
        }
        alertController.addAction(action)
        DispatchQueue.main.async {
            viewController.present(alertController, animated: true, completion: nil )
        }
    }
    
    static func showWarning(viewController: UIViewController, title:String, message: String, buttonTitle: String, completion: @escaping (DialogResult<Bool>) -> Void) {
        let alertController = MDCAlertController(title: title, message: message)
        alertController.titleIcon = UIImage(named: "baseline_warning_white_36pt")
        alertController.titleAlignment = .center
        alertController.cornerRadius = 13
        alertController.backgroundColor = UIColor(red: 253, green: 253, blue: 253)
        alertController.titleColor = UIColor.red
        alertController.titleIconTintColor = UIColor(rgb: 0xFFAF00)
        alertController.mdc_dialogPresentationController?.dismissOnBackgroundTap = false
        alertController.titleFont = UIFont(name: "Roboto-Bold",size:20)
        alertController.messageFont = UIFont(name: "Roboto-Regular",size:13)
        let action = MDCAlertAction(title:buttonTitle) {
            (action) in
            completion(.success(true))
        }
        alertController.addAction(action)
        DispatchQueue.main.async {
            viewController.present(alertController, animated: true, completion: nil )
        }
    }
    
    static func showError(viewController: UIViewController, title:String, message: String, buttonTitle: String, completion: @escaping (DialogResult<Bool>) -> Void) {
        let alertController = MDCAlertController(title: title, message: message)
        alertController.titleAlignment = .center
        alertController.cornerRadius = 13
        alertController.backgroundColor = UIColor(red: 253, green: 253, blue: 253)
        alertController.titleColor = UIColor.red
        alertController.titleIcon = UIImage(named: "baseline_error_outline_black_36pt")
        alertController.titleIconTintColor = UIColor.red
        alertController.mdc_dialogPresentationController?.dismissOnBackgroundTap = false
        alertController.titleFont = UIFont(name: "Roboto-Bold",size:20)
        alertController.messageFont = UIFont(name: "Roboto-Regular",size:13)
        let action = MDCAlertAction(title:buttonTitle) {
            (action) in
            completion(.success(true))
        }
        alertController.addAction(action)
        DispatchQueue.main.async {
            viewController.present(alertController, animated: true, completion: nil )
        }
    }
    
    
    
    static func showSuccess(viewController: UIViewController, title:String, message: String, buttonTitle: String, completion: @escaping (DialogResult<Bool>) -> Void) {
        let alertController = MDCAlertController(title: title, message: message)
        alertController.titleAlignment = .center
        alertController.cornerRadius = 13
        alertController.backgroundColor = UIColor(red: 253, green: 253, blue: 253)
        alertController.titleColor = UIColor.red
        alertController.titleIcon = UIImage(named: "baseline_done_white_36pt")
        alertController.titleIconTintColor = UIColor.red
        alertController.mdc_dialogPresentationController?.dismissOnBackgroundTap = false
        alertController.titleFont = UIFont(name: "Roboto-Bold",size:20)
        alertController.messageFont = UIFont(name: "Roboto-Regular",size:13)
        let action = MDCAlertAction(title:buttonTitle) {
            (action) in
            completion(.success(true))
        }
        alertController.addAction(action)
        DispatchQueue.main.async {
            viewController.present(alertController, animated: true, completion: nil )
        }
    }
    
    static func showModalDialog(viewController: UIViewController) {
        var dialogTransitionController: MDCDialogTransitionController
        
        dialogTransitionController = MDCDialogTransitionController()
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = dialogTransitionController
        
        viewController.present(viewController,animated: true,completion: nil)
    }
    
    static func showLoading() {
        DispatchQueue.main.async {
            LoadingDialog.show("loading".localized(), disableUI: true)
        }
        
    }
    
    static func hideLoading() {
        DispatchQueue.main.async {
            LoadingDialog.hide()
        }
        
    }
}

