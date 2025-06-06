//
//  Language.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import Combine
import DQCommon
import SwiftUI

class AppLanguage {
    var bundleLanguage: Bundle = .main
    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        LanguageManager.shared.onChangeLanguageBundle.sink { [weak self] _ in
            self?.loadLanguage()
        }.store(in: &cancellableSet)
    }

    func loadLanguage(languageCode: String? = nil) {
        let languageCodeCurrent = languageCode == nil ? LanguageManager.shared.currentLanguage.getLanguageCode() : languageCode!

        if let path = Bundle.main.path(forResource: languageCodeCurrent, ofType: "lproj") {
            bundleLanguage = Bundle(path: path)!
        }
    }
}

func language(_ keyLanguage: String) -> String {
    return NSLocalizedString(keyLanguage, bundle: AppDataManager.shared.appLanguage.bundleLanguage, comment: "")
}

func language(_ keyLanguage: String) -> LocalizedStringKey {
    return LocalizedStringKey(keyLanguage)
}

extension Image {
    static func image(_ name: String) -> Image {
        return Image(name, bundle: Bundle.main)
    }
}
