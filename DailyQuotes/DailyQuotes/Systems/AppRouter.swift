//
//  AppRouter.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import DQCommon
import SwiftUI

struct AppRouterView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var languageManager = LanguageManager.shared
    @StateObject private var themeManager = ThemeManager.shared

    var body: some View {
        TabbarRouterView()
            .environmentObject(themeManager)
            .environmentObject(self.languageManager)
            .environment(\.locale, .init(identifier: self.languageManager.currentLanguage.getLanguageCode()))
            .onAppear {
                themeManager.initializeThemeIfNeeded(colorScheme: colorScheme)
            }
    }
}
