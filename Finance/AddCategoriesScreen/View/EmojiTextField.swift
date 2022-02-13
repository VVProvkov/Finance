//
//  EmojiTextField.swift
//  Finance
//
//  Created by Vadim on 14.01.2022.
//

import Foundation
import UIKit


class EmojiTextField: UITextField {

    override var textInputContextIdentifier: String? { "" } // return non-nil to show the Emoji keyboard ¯\_(ツ)_/¯

    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}
