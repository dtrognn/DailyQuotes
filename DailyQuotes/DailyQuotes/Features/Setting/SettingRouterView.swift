//
//  SettingRouterView.swift
//  DailyQuotes
//
//  Created by dtrognn on 1/3/25.
//

import DQCommon
import SwiftUI

enum SettingDestination: Route {}

struct SettingRouterView: View {
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            SettingView()
                .environmentObject(router)
        }.navigationDestination(for: SettingDestination.self) { _ in
            //
        }
    }
}
