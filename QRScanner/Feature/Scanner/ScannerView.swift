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
    @State private var details = [String]()
    @State private var scannedQRDetail = ScannedQRDetail(qrContent: [""], type: "", data: "")
    var body: some View {
        NavigationView {
            VStack{
                CodeScannerView(codeTypes: [.qr], completion: handleScan)
                NavigationLink(destination: QRScanDetailView(qrContent: details), isActive: $isShowDetailScreen) {
                    EmptyView()
                }
            }
            
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>)  {
        switch result {
        case .success(let result):
            details =  result.string.components(separatedBy: "\n")
            var type: String {
                if details.contains("youtube") {
                    return "Youtube"
                } else if details.contains("twitter") {
                    return "Twitter"
                }
                else if details.contains("instagram") {
                    return "Instagram"
                }
                else if details.contains("whatsapp") {
                    return "WhatsApp"
                }
                else if (details.contains("@") && details.contains(".com") ) {
                    return "Mail"
                }
                else if details.contains("https") {
                    return "webSite"
                }
                else {
                    return "Text"
                }
            }
            scannedQRDetail.type = type
            scannedQRDetail.qrContent = details
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
