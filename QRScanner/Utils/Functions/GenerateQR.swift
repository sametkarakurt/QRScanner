//
//  GenerateQR.swift
//  QRScanner
//
//  Created by Samet Karakurt on 25.09.2022.
//

import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

func generateQR(from section: FormSection) -> UIImage {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var qrData =  ""
    
   
    
    for item in section.items {
        switch section.key {
        case .Instagram:
            if(item.key == FormItem.Key.spotifySong){
                qrData += "spotify:search:\(item.val);"
            }else{
                qrData += item.val
            }

        case .Spotify:
            print(item.key)
            if(item.key == FormItem.Key.spotifySinger){
                qrData += "spotify:search:\(item.val);"
            }else if(item.key == FormItem.Key.spotifySong){
                print(item.val)
                qrData += item.val
            }
        case .Mail:
            if(item.key == FormItem.Key.spotifySong){
                qrData += "spotify:search:\(item.val);"
            }else{
                qrData += item.val
            }

        case .Twitter:
            if(item.key == FormItem.Key.spotifySong){
                qrData += "spotify:search:\(item.val);"
            }else{
                qrData += item.val
            }

        case .WhatsApp:
            if(item.key == FormItem.Key.spotifySong){
                qrData += "spotify:search:\(item.val);"
            }else{
                qrData += item.val
            }

        case .Youtube:
            if(item.val == "youtubeUrl"){
               
                qrData += "\(item.pickerItemVal)"
            }else if(item.val == "youtubeChannel"){
                qrData += "\(QRContents.Contents.youtube.rawValue)channel/\(item.pickerItemVal)"
            }
            else if(item.val == "youtubeVideo"){
                qrData += "\(QRContents.Contents.youtube.rawValue)watch?v=\(item.pickerItemVal)"
            }

        case .webSite:
            if(item.key == FormItem.Key.spotifySong){
                qrData += "spotify:search:\(item.val);"
            }else{
                qrData += item.val
            }

        case .Sms:
            if(item.key == FormItem.Key.spotifySong){
                qrData += "spotify:search:\(item.val);"
            }else{
                qrData += item.val
            }
            
        case .PersonalCard:
            if(item.key == FormItem.Key.personalCardName){
                qrData += "BEGIN:VCARD\nVERSION:3.0\nN:\(item.val)\nFN:\(item.val)\n"
            }else if(item.key == FormItem.Key.personalCardPhoneNumber){
                qrData += "TEL;HOME;VOICE:\(item.val)\n"
            }else if(item.key == FormItem.Key.email){
                qrData += "EMAIL;PREF;INTERNET:\(item.val)\nEND:VCARD"
            }

        }
  
    }
    
    filter.message = Data(qrData.utf8)
    
    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }
    
    return UIImage(systemName:  "xmark.circle") ?? UIImage()
    
}
