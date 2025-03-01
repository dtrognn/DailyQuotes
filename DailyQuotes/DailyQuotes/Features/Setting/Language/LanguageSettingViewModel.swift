//
//  LanguageSettingViewModel.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon
import Foundation

final class LanguageSettingViewModel: BaseViewModel {
    @Published var languages: [LanguageItemData] = []

    private var languageManager = LanguageManager.shared

    override func makeSubscription() {
        languageManager.onChangeLanguage.sink { [weak self] _ in
            guard let self = self else { return }
            self.initData()
        }.store(in: &cancellableSet)
    }

    override func initData() {
        let languageCodeCurrent = languageManager.currentLanguage
        languages = [
            .init(
                id: UUID().uuidString,
                leftImage: .image("ic_cm_world"),
                title: language("Language_A_02"),
                value: .system,
                isSelected: languageCodeCurrent == .system,
                onSelect: { languageCode in
                    self.languageManager.setLanguage(languageCode)
                }),

            .init(
                id: UUID().uuidString,
                leftImage: .image("ic_flag_vn"),
                title: language("Language_A_03"),
                value: .vi,
                isSelected: languageCodeCurrent == .vi,
                onSelect: { languageCode in
                    self.languageManager.setLanguage(languageCode)
                }),

            .init(
                id: UUID().uuidString,
                leftImage: .image("ic_flag_gb"),
                title: language("Language_A_04"),
                value: .en,
                isSelected: languageCodeCurrent == .en,
                onSelect: { languageCode in
                    self.languageManager.setLanguage(languageCode)
                }),

            .init(
                id: UUID().uuidString,
                leftImage: .image("ic_flag_jp"),
                title: language("Language_A_05"),
                value: .ja,
                isSelected: languageCodeCurrent == .ja,
                onSelect: { languageCode in
                    self.languageManager.setLanguage(languageCode)
                }),
        ]
    }
}
