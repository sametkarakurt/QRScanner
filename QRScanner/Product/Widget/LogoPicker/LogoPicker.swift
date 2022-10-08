//
//  LogoPicker.swift
//  QRScanner
//
//  Created by Samet Karakurt on 8.10.2022.
//

import SwiftUI

struct LogoPicker: View {
    @Binding var selectedLogo: String

        var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(IconItems.Category.allCases, id: \.self) { logo in
                        Image(logo.rawValue)
                            .resizable()
                            .frame(width: 45, height: 45)
                            .opacity(selectedLogo == logo.rawValue ? 0.5 : 1.0)
                            .scaleEffect(selectedLogo == logo.rawValue ? 1.1 : 1.0)
                            .onTapGesture {
                                selectedLogo = logo.rawValue
                            }
                            
                            
                    }
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(20)
                .padding(.horizontal)

            }
        }
}
