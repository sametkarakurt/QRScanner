//
//  TabWidget.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import SwiftUI
import Localize_Swift

struct TabWidget: View {
    
    @StateObject var viewRouter: ViewRouter
    @State private var showPopUp = false
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                Spacer()
                switch viewRouter.currentPage {
                case.generate:
                    GenerateView()
                case.scanner:
                    ScannerView()
                case.history:
                    HistoryView()
                }
                Spacer()
                ZStack {
                    Spacer()
                    HStack{
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .generate, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "qrcode", tabName: "generate".localized())
                        Spacer()
                        ZStack {
                            Circle()
                                .foregroundColor(Color.casablanca)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/9-7, height: geometry.size.width/9-7)
                                .foregroundColor(Color.black)
                        }
                        .offset(y: -geometry.size.height/8/2)
                        .onTapGesture {
                            viewRouter.currentPage = .scanner
                        }
                        Spacer()
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .history, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "tray", tabName: "history".localized())
                    }
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color.mineShaft)
                    .shadow(radius: 2)
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            
        }
    }
}

struct TabWidget_Previews: PreviewProvider {
    static var previews: some View {
        TabWidget(viewRouter: ViewRouter())
    }
}
