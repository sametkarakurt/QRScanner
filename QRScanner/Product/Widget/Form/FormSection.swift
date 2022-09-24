//
//  FormSection.swift
//  QRScanner
//
//  Created by Samet Karakurt on 21.09.2022.
//

import Foundation

struct FormSection: Identifiable {
    let id = UUID()
    let key: Key
    let header: String?
    let footer: String?
    var items: [FormItem]
   
}
