//
//  FormItem.swift
//  QRScanner
//
//  Created by Samet Karakurt on 21.09.2022.
//

import Foundation

struct FormItem: Identifiable,Hashable {
    static func == (lhs: FormItem, rhs: FormItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    let id = UUID()
    let key: Key
    let kind: Kind
    var val: String
    var pickerItemVal = ""
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}
