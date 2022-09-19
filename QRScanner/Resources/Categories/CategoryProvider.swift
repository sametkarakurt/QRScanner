//
//  CategoryProvider.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import Foundation
import SwiftUI


class CategoryProvider : ObservableObject {
    
    @Published var categories: [Category] = []
    
    init() {
        for category in IconItems.Category.allCases {
            categories.append(Category.init(categoryName:String(describing: category), categoryImage: category.rawValue))
        }
        
    }
}
