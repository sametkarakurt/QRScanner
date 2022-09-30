//
//  QRBeautifyView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 30.09.2022.
//

import SwiftUI

struct QRBeautifyView: View {
    @Binding var qrImage: UIImage
    @State private var bgColor = Color.white
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Image(uiImage: qrImage)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.75)
                
                CustomColorPicker(selectedColor: $bgColor)
                
                ColorPicker("Set the background color", selection: $bgColor)
                    .padding()
                    
            }
            .frame(width:  geometry.size.width , height:  geometry.size.height , alignment: .center)
    
        }
    }
}

