//
//  FormManagerProtocol.swift
//  QRScanner
//
//  Created by Samet Karakurt on 21.09.2022.
//

import Foundation

protocol FormManagerImpl {
    var sections: [FormSection] { get set }
    func load()
    
}
