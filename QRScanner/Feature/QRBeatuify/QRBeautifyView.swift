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
                   
                    
            }
            .frame(width:  geometry.size.width , height:  geometry.size.height , alignment: .center)
    
        }
    }
}

