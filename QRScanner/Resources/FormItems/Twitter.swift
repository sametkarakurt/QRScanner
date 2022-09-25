//
//  Twitter.swift
//  QRScanner
//
//  Created by Samet Karakurt on 22.09.2022.
//

import Foundation

let twitterUsernameFormItem = FormItem(key: .twitterUsername, kind: .text(config: .init(title: "Twitter Username", keyboardInputType: .namePhonePad, textContentType: .nickname)), val: "")

let twittermUrlFormItem = FormItem(key: .twitterUrl, kind: .text(config: .init(title: "URL", keyboardInputType: .URL, textContentType: .URL)), val: "")

let twitterSection = FormSection(key: .Twitter, header: "Twitter", footer: "", items: [twitterUsernameFormItem,twittermUrlFormItem], qrData: "\(twitterUsernameFormItem.val)")

