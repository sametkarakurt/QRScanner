//
//  FindType.swift
//  QRScanner
//
//  Created by Samet Karakurt on 30.09.2022.
//

import Foundation

func findType(data: String) -> String {
    print(data)
    var type: String {
        if data.contains("youtube") {
            return "Youtube"
        } else if data.contains("twitter") {
            return "Twitter"
        }
        else if data.contains("instagram") {
            return "Instagram"
        }
        else if data.contains("whatsapp") {
            return "WhatsApp"
        }
        else if (data.contains("@") && data.contains(".com") ) {
            return "Mail"
        }
        else if data.contains("https") {
            return "webSite"
        }
        else if data.contains("spotify") {
            return "Spotify"
        }
        else {
            return "Text"
        }
    }
    return type
}
