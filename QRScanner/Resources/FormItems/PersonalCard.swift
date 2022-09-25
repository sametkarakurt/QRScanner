//
//  PersonalCard.swift
//  QRScanner
//
//  Created by Samet Karakurt on 25.09.2022.
//

import Foundation


let personalCardNameFormItem = FormItem(key: .personalCardName, kind: .text(config: .init(title: "Adı", keyboardInputType: .namePhonePad, textContentType: .name)), val: "")

let personalCardPhoneFormItem = FormItem(key: .personalCardPhoneNumber, kind: .phoneNumber(config: .init(title: "Telefon Numarası", keyboardInputType: .phonePad, textContentType: .telephoneNumber)), val: "")

let personalCardMailFormItem = FormItem(key: .email, kind: .text(config: .init(title: "Email", keyboardInputType: .emailAddress, textContentType: .emailAddress)), val: "")

let personalCardSection = FormSection(key: .PersonalCard, header: "Personal Card", footer: "", items: [personalCardNameFormItem,personalCardPhoneFormItem,personalCardMailFormItem], qrData: "")
