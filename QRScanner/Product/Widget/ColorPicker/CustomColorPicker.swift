//
//  CustomColorPicker.swift
//  QRScanner
//
//  Created by Samet Karakurt on 30.09.2022.
//

import SwiftUI

struct CustomColorPicker: View {
    @Binding var selectedColor: Color
    private let colors:[Color] = [.red, .yellow, .orange, .purple, .blue, .indigo, .green, .mint, .black, .casablanca]
        
        var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(colors, id: \.self) { color in
                        if(color != .casablanca){
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 45, height: 45)
                                .opacity(color == selectedColor ? 0.5 : 1.0)
                                .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                                .onTapGesture {
                                    selectedColor = color
                                }
                        } else {
                            ColorPicker( "", selection: $selectedColor)
                                .labelsHidden()
                                .frame(width: 45, height: 45)
                                .scaleEffect(1.5)
                              
                               
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

