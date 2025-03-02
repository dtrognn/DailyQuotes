//
//  ThemeManager.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import Combine
import SwiftUI

public enum ThemeType: Int {
    case dark = 0
    case light = 1
}

public final class ThemeManager: ObservableObject {
    public static let shared = ThemeManager()

    @Published public var currentTheme: AppTheme
    public var onChangeTheme = PassthroughSubject<Void, Never>()

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
            setupTheme(currentTheme)
        }
    }

    public func initializeThemeIfNeeded(colorScheme: ColorScheme) {
        if UserDefaults.standard.object(forKey: KEY_APP_THEME) == nil {
            let initialTheme = colorScheme == .dark ? ThemeType.dark : ThemeType.light
            theme = initialTheme
            currentTheme = initialTheme == .dark ? .darkTheme : .lightTheme

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                self.setupTheme(self.currentTheme)
                self.saveThemeToLocal(initialTheme)
            }
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
        onChangeTheme.send(())
        setupTheme(currentTheme)
        saveThemeToLocal(theme)
    }
}

extension ThemeManager {
    private func saveThemeToLocal(_ theme: ThemeType) {
        self.theme = theme
        UserDefaults.standard.set(theme.rawValue, forKey: KEY_APP_THEME)
        UserDefaults.standard.synchronize()
    }

    private func setupTheme(_ theme: AppTheme) {
        let tabbarAppearance = UITabBarAppearance()
        tabbarAppearance.configureWithDefaultBackground()
        tabbarAppearance.backgroundColor = theme.tabbarBackgroundColor.asUIColor()

        UITabBar.appearance().standardAppearance = tabbarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabbarAppearance
    }
}
