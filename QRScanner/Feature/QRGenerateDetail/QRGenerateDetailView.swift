//
//  QRDetailView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 25.09.2022.
//

import SwiftUI

struct QRDetailView: View {
    let qrImage: UIImage
    let imageSaver = ImageSaver()
    var body: some View {
        GeometryReader { geometry in
            Image(uiImage: qrImage)
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: geometry.size.width * 0.75)
            
            Button("Save") {
               
                imageSaver.writeToPhotoAlbum(image: qrImage)
            }
        }
  
    }
}

struct QRDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QRDetailView(qrImage: UIImage())
    }
}
