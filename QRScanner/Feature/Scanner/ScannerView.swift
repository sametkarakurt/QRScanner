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
