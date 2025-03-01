//
//  SettingRouterView.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon
import SwiftUI

enum SettingDestination: Route {
    case language
}

struct SettingRouterView: View {
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            SettingView()
                .navigationDestination(for: SettingDestination.self) { destination in
                    switch destination {
                    case .language:
                        LanguageSettingView()
                    }
                }
        }.environmentObject(router)
    }
}
