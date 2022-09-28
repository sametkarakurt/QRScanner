//
//  QRDetailView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 25.09.2022.
//

import SwiftUI

struct QRGenerateDetailView: View {
    let qrDetail: GeneratedQRDetail
    let imageSaver = ImageSaver()
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        GeometryReader { geometry in
            
            VStack( spacing: 20){
                
                
                Image(uiImage: qrDetail.qrCode)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.75)
                
                
                
                HStack (spacing:20){
                    Button("Kaydet") {
                        
                        imageSaver.writeToPhotoAlbum(image: qrDetail.qrCode)
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
        .onFirstAppear {
            save()
        }
        
        
    }
    
    
    func share() {
        
        let activityController = UIActivityViewController(activityItems: [qrDetail.qrCode], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
    
    func save() {
        
        let savedQR = GeneratedQR(context: moc)
        savedQR.id = UUID()
        savedQR.data = qrDetail.qrData
        savedQR.type = qrDetail.qrType
        savedQR.qrCode = qrDetail.qrCode.jpegData(compressionQuality: 1.0)
        try? moc.save()
        
    }
}

