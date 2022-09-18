//
//  ViewRouter.swift
//  QRScanner
//
//  Created by Samet Karakurt on 18.09.2022.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .generate
}

