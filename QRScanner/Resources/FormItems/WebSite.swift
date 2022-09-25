//
//  WebSite.swift
//  QRScanner
//
//  Created by Samet Karakurt on 22.09.2022.
//

import Foundation

let webSiteFormItem = FormItem(key: .webSite, kind: .text(config: .init(title: "webSite", keyboardInputType: .URL, textContentType: .URL)), val: "")

let webSiteSection = FormSection(key: .webSite, header: "webSite", footer: "", items:[webSiteFormItem],qrData: "\(webSiteFormItem.val)")
