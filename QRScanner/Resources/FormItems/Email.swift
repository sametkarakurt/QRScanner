//
//  Email.swift
//  QRScanner
//
//  Created by Samet Karakurt on 22.09.2022.
//

import Foundation

let mailFormItem = FormItem(key: .email, kind: .text(config: .init(title: "Email", keyboardInputType: .emailAddress, textContentType: .emailAddress)), val: "")

let mailSection = FormSection(key: .Mail, header: "Email", footer: "", items:[mailFormItem])
