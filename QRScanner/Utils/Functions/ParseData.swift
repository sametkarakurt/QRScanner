//
//  ParseData.swift
//  QRScanner
//
//  Created by Samet Karakurt on 30.09.2022.
//

import Foundation

func parseData(data: [String]) -> [String] {
    var type: String {
       
        if data.contains("whatsapp") {
            return "WhatsApp"
        }
        
        else if data.contains("https") {
            return "webSite"
        }
        else {
            return "Text"
        }
    }
    return data
}
