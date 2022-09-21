//
//  Form.swift
//  QRScanner
//
//  Created by Samet Karakurt on 21.09.2022.
//

import Foundation
import UIKit

extension FormItem {
    enum Kind {
        case text(config: TextConfig)
    }

}

extension FormItem {
    enum Key: String {
        case prefix
        case firstName
        case lastName
        
        case instagramUsername
        case instagramURL
        
    }
}


extension FormItem.Kind{
    struct TextConfig {
        let title: String
        let keyboardInputType: UIKeyboardType
        let textContentType: UITextContentType
    }
}

extension FormSection {
    enum Key: String {
        case Instagram
        case Spotify
    }
}
