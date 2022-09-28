//
//  MainButton.swift
//  QRScanner
//
//  Created by Samet Karakurt on 27.09.2022.
//
import SwiftUI

struct MainButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 125, height: 30, alignment: .center)
            .font(.title3.weight(.heavy))
            .foregroundColor(.white)
            .font(.subheadline.weight(.heavy))
            .padding()
    }
}

extension View {
    func mainButtonStyle() -> some View {
        modifier(MainButton())
    }
}

