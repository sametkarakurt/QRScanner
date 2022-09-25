//
//  FormManager.swift
//  QRScanner
//
//  Created by Samet Karakurt on 21.09.2022.
//

import Foundation

final class FormManager: ObservableObject, FormManagerImpl {
    @Published var sections: [FormSection] = []
    
    func load() {
        
        self.sections = [
            instagramSection,
            spotifySection,
            mailSection,
            twitterSection,
            whatsAppSection,
            webSiteSection,
            youtubeSection,
            smsSection,
            personalCardSection
        ]
    }
}
