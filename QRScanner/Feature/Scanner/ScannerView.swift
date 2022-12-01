//
//  ScannerView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import SwiftUI
import CodeScanner

struct ScannerView: View {
    @State private var isShowDetailScreen = false
    @State private var details = String()
    @State private var scannedQR = ScannedQRDetail(type: "", data: "",icon: "")
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading){
                
         
                CodeScannerView(codeTypes: [.qr],manualSelect: true,showViewfinder:true, completion: handleScan)
                   
                   
                NavigationLink(destination: QRScanDetailView(scannedQRDetail: scannedQR, isScanned: true), isActive: $isShowDetailScreen) {
                    EmptyView()
                }
                
                

       
            }.edgesIgnoringSafeArea(.all)
        }
           

        
    }
    
    func handleScan(result: Result<ScanResult, ScanError>)  {
        switch result {
        case .success(let result):
            details = result.string

           
            scannedQR.data = details
            scannedQR.type =  findType(data: details)
            scannedQR.icon = findIcon(data: scannedQR.type ?? "Unknown")
      
            isShowDetailScreen = true
            
        case .failure(let error):
            print("Scanning failed \(error.localizedDescription)")
        }
        
    }
    
    
    
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
