//
//  WhatsApp.swift
//  QRScanner
//
//  Created by Samet Karakurt on 22.09.2022.
//

import Foundation

let whatsAppFormItem = FormItem(key: .whatsAppPhoneNumber, kind: .phoneNumber(config: .init(title: "WhatsApp", keyboardInputType: .phonePad, textContentType: .telephoneNumber)), val: "")

let whatsAppSection = FormSection(key: .WhatsApp, header: "WhatsApp", footer: "", items:[whatsAppFormItem])
