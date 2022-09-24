//
//  GenerateQR.swift
//  QRScanner
//
//  Created by Samet Karakurt on 25.09.2022.
//

import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

func generateQR(from section: FormSection) -> UIImage {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    filter.message = Data(section.key.rawValue.utf8)
    
    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }
    
    return UIImage(systemName:  "xmark.circle") ?? UIImage()
    
}
