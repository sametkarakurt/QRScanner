//
//  QRScannerApp.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import SwiftUI

@main
struct QRScannerApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        
        WindowGroup {
            TabWidget(viewRouter: ViewRouter())
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
