//
//  QRScanDetailView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 26.09.2022.
//

import SwiftUI

struct QRScanDetailView: View {
    var qrContent: [String]
    var body: some View {
        Text("\(qrContent[0])")
   
    }
}
