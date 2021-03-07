//
//  MaterialTextFieldUtil.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 14.06.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation
import MaterialComponents


public class MaterialTextFieldUtil {
    
    static func setupTextFieldUnderline(textField: MDCTextField, length: Int? ) -> MDCTextInputControllerUnderline {
        
        let textFieldController: MDCTextInputControllerUnderline = MDCTextInputControllerUnderline(textInput: textField)
        textFieldController.activeColor = UIColor.darkGray
        textFieldController.floatingPlaceholderActiveColor = UIColor.darkGray
        
        if let lengthCount = length {
            textFieldController.characterCountMax = UInt(lengthCount)
        }
        
        return textFieldController
    }
    
}
