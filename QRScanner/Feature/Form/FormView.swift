//
//  FormView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 20.09.2022.
//

import SwiftUI

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
                                TextField(config.title,text: $item.val)
                                    .textContentType(config.textContentType)
                                    .keyboardType(config.keyboardInputType)
                            }
                        }
                    }header: {
                        if let headerTxt = section.header {
                            Text(headerTxt)
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
