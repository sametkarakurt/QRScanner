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

    var qrData =  ""
    let context = CIContext()
       
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
    
    var qrImage = UIImage(systemName: "xmark.circle") ?? UIImage()
      let data    = Data(qrData.utf8)
      let filter  = CIFilter.qrCodeGenerator()

      // ref : https://stackoverflow.com/questions/57704885/how-can-i-check-ios-devices-current-userinterfacestyle-programmatically
      var osTheme: UIUserInterfaceStyle { return UIScreen.main.traitCollection.userInterfaceStyle }
      filter.setValue(data, forKey: "inputMessage")

      let transform = CGAffineTransform(scaleX: 100, y: 100)
      if let outputImage = filter.outputImage?.transformed(by: transform) {
          if context.createCGImage(
            outputImage,
            from: outputImage.extent) != nil {

              let maskFilter = CIFilter.blendWithMask()
              maskFilter.maskImage = outputImage.applyingFilter("CIColorInvert")

              maskFilter.inputImage = CIImage(color: .white)

              let darkCIImage = maskFilter.outputImage!
              maskFilter.inputImage = CIImage(color: .black)

              let lightCIImage = maskFilter.outputImage!

              let darkImage   = context.createCGImage(darkCIImage, from: darkCIImage.extent).map(UIImage.init)!
              let lightImage  = context.createCGImage(lightCIImage, from: lightCIImage.extent).map(UIImage.init)!

              qrImage = osTheme == .light ? lightImage : darkImage
          }
      }
      return qrImage
    
    
}