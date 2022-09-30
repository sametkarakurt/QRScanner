//
//  HistoryView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import SwiftUI
import UIKit
import CoreData

struct HistoryView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var historySelection = "Generate"
    @FetchRequest(sortDescriptors: []) var generatedQR: FetchedResults<GeneratedQR>
    
    var options = ["Generate", "Scan"]
    var body: some View {
        NavigationView{
            VStack{
                
                List {
                    ForEach(generatedQR) { item in
                        NavigationLink {
                            let savedQRDetail = GeneratedQRDetail(qrData: item.data!, qrType: item.type!, qrCode: UIImage(data: item.qrCode!)!)
                            QRGenerateDetailView(qrDetail: savedQRDetail, icon: item.icon ?? "Unknown", isGenerated: true)
                        } label: {
                            HStack(spacing: 20){
                                
                                Image(item.icon ?? "Unknown")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                
                                VStack(alignment: .leading){
                                    Text(item.data!)
                                        .lineLimit(1)
                                        .font(.headline)
                                    Text(item.type!)
                                        .foregroundColor(.secondary)
                                    
                                }
                            }
                            
                        }
                    }
                    .onDelete(perform: deleteGeneratedQR)
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete All") {
                        deleteAll()
                    }                }
            }
            
        }
        
        
        
    }
    func deleteGeneratedQR(at offsets: IndexSet) {
        for offset in offsets {
            let item = generatedQR[offset]
            moc.delete(item)
            try? moc.save()
        }
    }
    
    func deleteAll() {

        let fetchRequest = GeneratedQR.fetchRequest()
        let items = try? moc.fetch(fetchRequest)
        for item in items ?? [] {
            moc.delete(item)
        }
        try? moc.save()
        
    }
    
    
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
