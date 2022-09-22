//
//  Youtube.swift
//  QRScanner
//
//  Created by Samet Karakurt on 22.09.2022.
//

import Foundation

let youtubePickerFormItem = FormItem(key: .youtubePicker, kind: .picker(config: .init(title: "", options: ["youtubeUrl","youtubeChannel","youtubeVideo"] ,items: [youtubeChannelFormItem,youtubeVideoFormItem,youtubeUrlFormItem])), val: "youtubeUrl", pickerItemVal: "")

let youtubeChannelFormItem = FormItem(key: .youtubeChannel, kind: .text(config: .init(title: "Youtube Kanal Kimliğini Girin", keyboardInputType: .namePhonePad, textContentType: .nickname)), val: "")

let youtubeVideoFormItem = FormItem(key: .youtubeVideo, kind: .text(config: .init(title: "Youtube Video Kimliğini Girin", keyboardInputType: .namePhonePad, textContentType: .nickname)), val: "")

let youtubeUrlFormItem = FormItem(key: .youtubeUrl, kind: .text(config: .init(title: "URL", keyboardInputType: .URL, textContentType: .URL)), val: "")

let youtubeSection = FormSection(key: .Youtube, header: "Youtube", footer: "", items: [youtubePickerFormItem])
