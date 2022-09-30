//
//  FindIcon.swift
//  QRScanner
//
//  Created by Samet Karakurt on 30.09.2022.
//

import Foundation

func findIcon(data: String) -> String{

    for item in IconItems.Category.allCases {
        if(item.description == data){
            return item.rawValue
        }
    }
    return "Unknown"
}
