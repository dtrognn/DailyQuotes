//
//  DailyQuotesApp.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import SwiftUI

@main
struct DailyQuotesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppRouterView()
        }
    }
}
