//
//  QRBeautifyView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 30.09.2022.
//

import SwiftUI

struct QRBeautifyView: View {
    @Binding var qrDetail: GeneratedQRDetail
    let section: FormSection
    @State var bgColor = Color.white
    let logo = UIImage(named: "ic_spotify")!

    var body: some View {
        GeometryReader { geometry in
            VStack{
                Image(uiImage: qrDetail.qrCode)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.75)
                
                
           
                
                CustomColorPicker(selectedColor: $bgColor)
                    .onChange(of: bgColor, perform: { _ in
                        
                        qrDetail.qrCode = generateQR(from: section, qrColor: bgColor).qrCode
                        
                    })
                   
                ColorPicker("Set the background color", selection: $bgColor)
                    .padding()
                
                Button("Add Label") {
                    qrDetail.qrCode = addLogo(UIImage(named: "ic_spotify")!, toImage: qrDetail.qrCode)!
                }
                
           
                   
                    
            }
            .frame(width:  geometry.size.width , height:  geometry.size.height , alignment: .center)
    
        }
    }
    
    private func addLogo(_ logo: UIImage, toImage image: UIImage) -> UIImage? {
   


      // Get size
      let sizeOfLogo = logo.size
      let heightOffset = sizeOfLogo.height
      let width = image.size.width
      let height = image.size.height

      UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)

      if let context = UIGraphicsGetCurrentContext() {
        UIColor.white.setFill()
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.fill(rect)
      }

      // Draw image
      image.draw(in: CGRect(x: 0, y: 0, width: width, height: image.size.height))

      // Draw text
      logo.draw(
        in: CGRect(
          x: (width / 2) - (sizeOfLogo.width / 2),
          y: (width / 2) - (sizeOfLogo.width / 2),
          width:  width/6 ,
          height: width/6)

      )
        
        

      // Get new image
      let newImage = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext()
      
      return newImage
    }

    

    private func addLabel(_ label: String, toImage image: UIImage) -> UIImage? {
      let font = UIFont.boldSystemFont(ofSize: 100)
      let text: NSString = NSString(string: label)

      // Set text font and color
      let attr = [
        NSAttributedString.Key.font: font,
        NSAttributedString.Key.foregroundColor: UIColor.systemBlue
      ]
      let textPadding: CGFloat = 24

      // Get size
      let sizeOfText = text.size(withAttributes: attr)
      let heightOffset = sizeOfText.height + textPadding * 2
      let width = image.size.width
      let height = image.size.height + heightOffset

      UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)

      if let context = UIGraphicsGetCurrentContext() {
        UIColor.white.setFill()
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.fill(rect)
      }

      // Draw image
      image.draw(in: CGRect(x: 0, y: heightOffset, width: width, height: image.size.height))

      // Draw text
      text.draw(
        in: CGRect(
          x: (width / 2) - (sizeOfText.width / 2),
          y: textPadding,
          width: width,
          height: height),
        withAttributes: attr
      )

      // Get new image
      let newImage = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext()
      
      return newImage
    }

}

