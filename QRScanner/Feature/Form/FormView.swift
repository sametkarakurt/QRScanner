//
//  FormView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 20.09.2022.
//

import SwiftUI
import Localize_Swift
struct FormView: View {
    @StateObject var manager = FormManager()
    let category: Category
    
    var body: some View {
        VStack{
            Image(category.categoryImage)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(.top)
            
            Text(category.categoryName.localized())
                .font(.headline)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
            
        }
        
        VStack(alignment: .leading, spacing: 20) {
            
            
            ForEach($manager.sections) { $section in
                       if(section.key.rawValue == category.categoryName){
                    
                    ForEach($section.items) { $item in
                        
                        switch item.kind {
                            
                        case .text(let config):
                            Section {
                                TextField(config.title.localized(),text: $item.val)
                                    .textContentType(config.textContentType)
                                    .keyboardType(config.keyboardInputType)
                                    .padding()
                                    .overlay(
                                        Capsule()
                                            .stroke(
                                                Color(category.categoryName)))
                                
                                
                                
                            }
                            
                            
                        case .phoneNumber(let config):
                            Section {
                                TextField(config.title,text: $item.val)
                                    .textContentType(config.textContentType)
                                    .keyboardType(config.keyboardInputType)
                                    .padding()
                                    .overlay(
                                        Capsule()
                                            .stroke(
                                                Color(category.categoryName)))
                            }
                            
                        case .textArea(let config):
                            Section {
                                TextEditor(text: $item.val)
                                    .textContentType(config.textContentType)
                                    .keyboardType(config.keyboardInputType)
                                    .padding()
                                    .overlay(
                                        Rectangle()
                                            .stroke(
                                                Color(category.categoryName)))
                                
                            }
                            
                            
                            
                        case .picker(let config):
                            
                            Section {
                                Picker(config.title, selection: $item.val) {
                                    ForEach(config.options, id: \.self) {
                                        Text($0.localized())
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding()
                                
                            }
                            
                            
                            ForEach(config.items, id: \.self) {pickerItem in
                                
                                if(pickerItem.key.rawValue == item.val){
                                    
                                    switch pickerItem.kind {
                                        
                                    case .text(let config):
                                        TextField(config.title.localized(),text: $item.pickerItemVal)
                                            .textContentType(config.textContentType)
                                            .keyboardType(config.keyboardInputType)
                                            .padding()
                                            .overlay(
                                                Capsule()
                                                    .stroke(
                                                        Color(category.categoryName)))
                                    case .phoneNumber(let config):
                                        TextField(config.title,text:  $item.pickerItemVal)
                                            .textContentType(config.textContentType)
                                            .keyboardType(config.keyboardInputType)
                                    case .textArea(let config):
                                        TextField(config.title,text:  $item.pickerItemVal)
                                            .textContentType(config.textContentType)
                                            .keyboardType(config.keyboardInputType)
                                        
                                    case .picker(let config):
                                        Picker(config.title, selection:  $item.pickerItemVal) {
                                            ForEach(config.options, id: \.self) {
                                                Text($0)
                                            }
                                            
                                            
                                        }
                                        .pickerStyle(.segmented)
                                        
                                        
                                    }
                                }
                            }
                            
                            
                        }
                        
                    }
                    
                    NavigationLink{
                        QRGenerateDetailView(qrDetail: generateQR(from: section, qrColor: .black, hasLogo: false, selectedLogo: ""), qrSection: section, icon: category.categoryImage, isGenerated:false)
                    } label: {
                        Text("Oluştur")
                    }
                    
                }
                
           
                
            }
           
            Spacer()
            
        }
        .padding()
        
        
        .onAppear(perform: {
            manager.load()
            
            
            
        })
        
        
        
    }
    
    
}


