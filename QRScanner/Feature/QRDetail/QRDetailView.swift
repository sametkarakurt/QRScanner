//
//  QRDetailView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 25.09.2022.
//

import SwiftUI

struct QRDetailView: View {
    let qrImage: UIImage
    var body: some View {
        Image(uiImage: qrImage)
            .resizable()
            .interpolation(.none)
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
}

struct QRDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QRDetailView(qrImage: UIImage())
    }
}
