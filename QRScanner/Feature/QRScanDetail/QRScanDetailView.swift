//
//  QRScanDetailView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 26.09.2022.
//

import SwiftUI

struct QRScanDetailView: View {
    let scannedQRDetail : ScannedQRDetail
    let isScanned: Bool
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        GeometryReader { geometry in
            
            VStack( spacing: 20){
                
                VStack{
                    HStack(alignment: .center){
                        Image(scannedQRDetail.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        Text(scannedQRDetail.type)
                            .font(.headline)
                    }
                    
                    
                    Text(scannedQRDetail.data)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                    
                }
                
                
                
                
                
                
                
                Spacer()
            }
            .frame(width:  geometry.size.width , height:  geometry.size.height , alignment: .center)
            
            
            
        }
        .onFirstAppear {
            save()
        }
        
    }
    func save() {
        if(isScanned){
            let scannedQR = ScannedQR(context: moc)
            scannedQR.id = UUID()
            scannedQR.data = scannedQRDetail.data
            scannedQR.type =  scannedQRDetail.type
            scannedQR.icon = scannedQRDetail.icon
            try? moc.save()
        }
    }
}
