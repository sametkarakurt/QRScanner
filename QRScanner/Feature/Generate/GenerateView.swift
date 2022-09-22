//
//  GenerateView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import SwiftUI
import Localize_Swift

struct GenerateView: View {
    @ObservedObject var categoryProvider = CategoryProvider()
    let columns = [GridItem(.adaptive(minimum:150))]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(categoryProvider.categories){category in
                    NavigationLink{
                        FormView(category: category.categoryName )
                    } label: {
                        VStack{
                            Image(category.categoryImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(.top)
                            VStack{
                                Text(category.categoryName.localized())
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.secondary)
                            
                        )
                        
                        
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
