//
//  SettingViewModel.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon

final class SettingViewModel: BaseViewModel {
    @Published var isDarkMode: Bool

    private var themeManager = ThemeManager.shared

    override init() {
        isDarkMode = themeManager.isDarkTheme
        super.init()
    }

    func setTheme(_ isOn: Bool) {
        self.themeManager.setTheme(isOn ? .dark : .light)
    }
}
