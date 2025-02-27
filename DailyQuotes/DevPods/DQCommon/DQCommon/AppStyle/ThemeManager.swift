//
//  ThemeManager.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

public enum ThemeType: Int {
    case dark = 0
    case light = 1
}

public final class ThemeManager: ObservableObject {
    public static let shared = ThemeManager()

    @Published public var currentTheme: AppTheme
    private var theme: ThemeType

    private let KEY_APP_THEME = "KEY_APP_THEME"

    private init() {
        currentTheme = .lightTheme
        theme = .light

        if let rawValue = UserDefaults.standard.object(forKey: KEY_APP_THEME) as? Int,
           let savedTheme = ThemeType(rawValue: rawValue)
        {
            theme = savedTheme
            currentTheme = savedTheme == .dark ? .darkTheme : .lightTheme
        }
    }

    public func initializeThemeIfNeeded(colorScheme: ColorScheme) {
        if UserDefaults.standard.object(forKey: KEY_APP_THEME) == nil {
            let initialTheme = colorScheme == .dark ? ThemeType.dark : ThemeType.light
            theme = initialTheme
            currentTheme = initialTheme == .dark ? .darkTheme : .lightTheme
            saveThemeToLocal(initialTheme)
        }
    }

    public var isDarkTheme: Bool {
        return theme == .dark
    }

    public var activeTheme: AppTheme {
        currentTheme
    }

    public func setTheme(_ theme: ThemeType) {
        currentTheme = theme == .dark ? .darkTheme : .lightTheme
        saveThemeToLocal(theme)
    }

    private func saveThemeToLocal(_ theme: ThemeType) {
        self.theme = theme
        UserDefaults.standard.set(theme.rawValue, forKey: KEY_APP_THEME)
        UserDefaults.standard.synchronize()
    }
}
