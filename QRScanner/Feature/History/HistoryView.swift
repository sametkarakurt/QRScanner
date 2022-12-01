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
    @FetchRequest(sortDescriptors: []) var scannedQR: FetchedResults<ScannedQR>
    var options = ["Generate", "Scan"]
    var body: some View {
        NavigationView{
            VStack{
                Picker("Please choose a color", selection: $historySelection) {
                                ForEach(options, id: \.self) {
                                    Text($0)
                                }
                            }
                .pickerStyle(.segmented)
                .colorMultiply(.secondary)
                .background(.white)
                .padding()
                if(historySelection == "Generate") {
                    List {
                        ForEach(generatedQR) { item in
                            NavigationLink {
                                let savedQRDetail = GeneratedQRDetail(qrData: item.data!, qrType: item.type!, qrCode: UIImage(data: item.qrCode!)!)
                                QRGenerateDetailView(qrDetail: savedQRDetail,qrSection: FormSection(key: FormSection.Key.Youtube, header: "", footer: "", items: [], qrData: ""), icon: item.icon ?? "Unknown", isGenerated: true)
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
                }else{
                    List  {
                        ForEach(scannedQR) { item in
                            NavigationLink {
                                QRScanDetailView(scannedQRDetail: ScannedQRDetail(type: item.type!, data: item.data!, icon: item.icon!),isScanned: false)
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
                NavigationLink(destination: EmptyView(), label: {})
                
                
                
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
        if(historySelection == "Generate") {
            for offset in offsets {
                let item = generatedQR[offset]
                moc.delete(item)
                try? moc.save()
            }
        } else {
            for offset in offsets {
                let item = scannedQR[offset]
                moc.delete(item)
                try? moc.save()
            }
        }
      
    }
    
    func deleteAll() {
        if(historySelection == "Generate"){
            let fetchRequest = GeneratedQR.fetchRequest()
            let items = try? moc.fetch(fetchRequest)
            for item in items ?? [] {
                moc.delete(item)
            }
            try? moc.save()
        } else {
            let fetchRequest = ScannedQR.fetchRequest()
            let items = try? moc.fetch(fetchRequest)
            for item in items ?? [] {
                moc.delete(item)
            }
            try? moc.save()
        }
       
        
    }
    
    
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
