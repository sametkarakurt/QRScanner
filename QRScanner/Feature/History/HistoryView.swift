//
//  HistoryView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import SwiftUI

struct HistoryView: View {
    @State private var historySelection = "Generate"
    @FetchRequest(sortDescriptors: []) var generatedQR: FetchedResults<GeneratedQR>
    
    var options = ["Generate", "Scan"]
    var body: some View {
        VStack{
          
            
            List(generatedQR) { item in
                Text(item.type ?? "Unknown")
            }
            
            
        }
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
