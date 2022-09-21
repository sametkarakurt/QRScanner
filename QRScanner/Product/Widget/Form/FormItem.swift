//
//  FormItem.swift
//  QRScanner
//
//  Created by Samet Karakurt on 21.09.2022.
//

import Foundation

struct FormItem: Identifiable {
    let id = UUID()
    let key: Key
    let kind: Kind
    var val: String
    
}
