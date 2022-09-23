//
//  Sms.swift
//  QRScanner
//
//  Created by Samet Karakurt on 23.09.2022.
//

import Foundation

let smsPhoneNumberFormItem = FormItem(key: .smsPhoneNumber, kind: .phoneNumber(config: .init(title: "Telefon Numarası", keyboardInputType: .phonePad, textContentType: .telephoneNumber)), val: "")

let smsTextFormItem = FormItem(key: .smsText, kind: .textArea(config: .init(title: "Lütfen bir şeyler girin", keyboardInputType: .default, textContentType: .name)), val: "")

let smsSection = FormSection(key: .Sms, header: "SMS", footer: "", items:[ smsPhoneNumberFormItem,smsTextFormItem])
