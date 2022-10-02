//
//  ConvertUIView.swift
//  QRScanner
//
//  Created by Samet Karakurt on 3.10.2022.
//

import Foundation
import SwiftUI

extension UIView {

    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
