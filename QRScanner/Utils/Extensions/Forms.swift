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
        case phoneNumber(config: TextConfig)
        case picker(config: PickerConfig)
    }

}

extension FormItem {
    enum Key: String {        
        case instagramUsername
        case instagramURL
        case spotifySong
        case spotifySinger
        case email
        case twitterUrl
        case twitterUsername
        case whatsAppPhoneNumber
        case webSite
        case youtubePicker
        case youtubeUrl
        case youtubeVideo
        case youtubeChannel
        
        
    }
}


extension FormItem.Kind{
    struct TextConfig {
        let title: String
        let keyboardInputType: UIKeyboardType
        let textContentType: UITextContentType
    }
}

extension FormItem.Kind{
    struct PickerConfig {
        let title: String
        let options: [String]
        let items: [FormItem]
    }
}


extension FormSection {
    enum Key: String {
        case Instagram
        case Spotify
        case Mail
        case Twitter
        case WhatsApp
        case Youtube
        case webSite
    }
}
