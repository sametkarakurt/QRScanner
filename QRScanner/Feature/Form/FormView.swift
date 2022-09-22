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
    let category: String
    var body: some View {
        Form {
            
            ForEach($manager.sections) { $section in
                
                if(section.key.rawValue == category){
                    Section {
                        ForEach($section.items) { $item in
                            
                            switch item.kind {
                                
                            case .text(let config):
                                TextField(config.title.localized(),text: $item.val)
                                    .textContentType(config.textContentType)
                                    .keyboardType(config.keyboardInputType)
                            case .phoneNumber(let config):
                                TextField(config.title,text: $item.val)
                                    .textContentType(config.textContentType)
                                    .keyboardType(config.keyboardInputType)
                            case .picker(let config):
                                
                                Picker(config.title, selection: $item.val) {
                                    ForEach(config.options, id: \.self) {
                                               Text($0)
                                           }
                                       }
                                       .pickerStyle(.segmented)
                      
                                ForEach(config.items, id: \.self) {pickerItem in
                                    
                                    if(pickerItem.key.rawValue == item.val){
                                        if let pickerVal = item.pickerItemVal {
                                            switch pickerItem.kind {
                                            
                                            case .text(let config):
                                                TextField(config.title.localized(),text: $item.pickerItemVal)
                                                    .textContentType(config.textContentType)
                                                    .keyboardType(config.keyboardInputType)
                                            case .phoneNumber(let config):
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
                        
                    }
                }header: {
                    if let headerTxt = section.header {
                        Text(headerTxt.localized())
                    }
                } footer: {
                    if let footerTxt = section.footer {
                        Text(footerTxt)
                    }
                }
            }
            
            
            
        }
    }.onAppear(perform: manager.load)
    
    
}
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(category: "Spotify")
    }
}
