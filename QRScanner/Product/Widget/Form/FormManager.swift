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
        
        //MARK: - Instagram Section
        
        let instagramUsernameFormItem = FormItem(key: .instagramUsername, kind: .text(config: .init(title: "instagramUsername", keyboardInputType: .default, textContentType: .nickname)), val: "")
        
        let instagramUrlFormItem = FormItem(key: .instagramURL, kind: .text(config: .init(title: "URL", keyboardInputType: .default, textContentType: .URL)), val: "")
        
        let instagramSection = FormSection(key: .Instagram, header: "Instagram", footer: "", items: [instagramUsernameFormItem,instagramUrlFormItem])
        
        //MARK: - Spotify Section
        
        let spotifySingerFormItem = FormItem(key: .instagramUsername, kind: .text(config: .init(title: "Sanatçı Adı", keyboardInputType: .namePhonePad, textContentType: .name)), val: "")
        
        let spotifySongFormItem = FormItem(key: .instagramURL, kind: .text(config: .init(title: "Şarkı Adı", keyboardInputType: .namePhonePad, textContentType: .name)), val: "")
        
        let spotifySection = FormSection(key: .Spotify, header: "Spotify", footer: "", items:[ spotifySingerFormItem,spotifySongFormItem])
        
        self.sections = [
            instagramSection,
            spotifySection
        ]
    }
}
