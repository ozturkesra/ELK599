//
//  AdaptiveScrollView.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 20.06.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

class AdaptiveScrollView: UIScrollView {
    
    private func setup() {
        let defaultCenter = NotificationCenter.default
        defaultCenter.addObserver(self,
                                  selector: #selector(AdaptiveScrollView.keyboardDidChangeFrame(_:)),
                                  name: UIResponder.keyboardDidChangeFrameNotification,
                                  object: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    @objc func keyboardDidChangeFrame(_ notification:Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardSize = keyboardFrame.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        adjustContentInsets(contentInsets)
    }
    
    private func adjustContentInsets(_ contentInsets: UIEdgeInsets) {
        contentInset = contentInsets
        scrollIndicatorInsets = contentInsets
    }
}
