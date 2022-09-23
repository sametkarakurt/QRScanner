//
//  Icons.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import Foundation

struct IconItems {
    enum Category: String,CaseIterable,CustomStringConvertible{
        var description: String {
            switch self {
            case .spotify:
                return "Spotify"
            case .whatsapp:
                return "WhatsApp"
            case .twitter:
                return "Twitter"
            case .youtube:
                return "Youtube"
            case .instagram:
                return "Instagram"
            case .wifi:
                return "Wifi"
            case .telephoneDirectory:
                return "Kişiler"
            case .text:
                return "Text"
            case .mail:
                return "Mail"
            case .sms:
                return "Sms"
            case .personCard:
                return "Personal Card"
            case .webSite:
                return "webSite"
            }
            
        }
        
        case spotify = "ic_spotify"
        case whatsapp = "ic_whatsapp"
        case twitter = "ic_twitter"
        case youtube = "ic_youtube"
        case instagram = "ic_instagram"
        case wifi = "ic_wifi"
        case telephoneDirectory = "ic_telephoneDirectory"
        case text = "ic_text"
        case webSite = "ic_webSite"
        case mail = "ic_email"
        case sms = "ic_sms"
        case personCard = "ic_identificationCard"
   
        
    }
}

