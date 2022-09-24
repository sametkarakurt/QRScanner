//
//  ScannerView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import SwiftUI
import CodeScanner

struct ScannerView: View {
    @State private var isShowingScanner = false
    var body: some View {
        CodeScannerView(codeTypes: [.qr], completion: handleScan)
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            print(details)
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
