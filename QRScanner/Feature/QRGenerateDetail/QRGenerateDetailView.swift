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
            
            VStack( spacing: 20){
                Image(uiImage: qrImage)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.75)
                
                HStack (spacing:20){
                    Button("Kaydet") {
                        
                        imageSaver.writeToPhotoAlbum(image: qrImage)
                    }
                    .mainButtonStyle()
                    .background(.green)
                    .clipShape(Capsule())
                    
                    Button("Paylaş") {
                        
                        share()
                    }
                    .mainButtonStyle()
                    .background(.green)
                    .clipShape(Capsule())
                }
                
                Spacer()
            }
            .frame(width:  geometry.size.width , height:  geometry.size.height , alignment: .center)
            
            
            
            
        }
        
        
    }
    
    func share() {
        
        let activityController = UIActivityViewController(activityItems: [qrImage], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct QRDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QRDetailView(qrImage: UIImage())
    }
}
