//
//  Instagram.swift
//  QRScanner
//
//  Created by Samet Karakurt on 22.09.2022.
//

import Foundation

let instagramUsernameFormItem = FormItem(key: .instagramUsername, kind: .text(config: .init(title: "instagramUsername", keyboardInputType: .namePhonePad, textContentType: .nickname)), val: "")

let instagramUrlFormItem = FormItem(key: .instagramURL, kind: .text(config: .init(title: "URL", keyboardInputType: .URL, textContentType: .URL)), val: "")

let instagramSection = FormSection(key: .Instagram, header: "Instagram", footer: "", items: [instagramUsernameFormItem,instagramUrlFormItem])

