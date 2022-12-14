//
//  Spotify.swift
//  QRScanner
//
//  Created by Samet Karakurt on 22.09.2022.
//

import Foundation

let spotifySingerFormItem = FormItem(key: .spotifySinger, kind: .text(config: .init(title: "Sanatçı Adı", keyboardInputType: .namePhonePad, textContentType: .name)), val: "")

let spotifySongFormItem = FormItem(key: .spotifySong, kind: .text(config: .init(title: "Şarkı Adı", keyboardInputType: .namePhonePad, textContentType: .name)), val: "")

let spotifySection = FormSection(key: .Spotify, header: "Spotify", footer: "", items:[ spotifySingerFormItem,spotifySongFormItem],qrData: "")



