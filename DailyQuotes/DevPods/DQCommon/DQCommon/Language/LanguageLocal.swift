//
//  LanguageLocal.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import Combine
import Foundation

class LanguageLocal {
    static let shared = LanguageLocal()
    var bundleLanguage: Bundle = .dqCommonResourceBundle()
    private var cancellableSet: Set<AnyCancellable> = []

    private init() {
        LanguageManager.shared.onChangeLanguageBundle.sink { [weak self] _ in
            self?.loadLanguage()
        }.store(in: &cancellableSet)
    }

    func loadLanguage(languageCode: String? = nil) {
        let languageCodeCurrent = languageCode == nil ? LanguageManager.shared.currentLanguage.getLanguageCode() : languageCode!

        if let path = Bundle.dqCommonResourceBundle().path(forResource: languageCodeCurrent, ofType: "lproj") {
            bundleLanguage = Bundle(path: path)!
        }
    }
}

func language(_ keyLanguage: String) -> String {
    return NSLocalizedString(keyLanguage, bundle: LanguageLocal.shared.bundleLanguage, comment: "")
}
