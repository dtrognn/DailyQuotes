//
//  AppDelegate.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        AppConfigurationManager.shared.loadCommonConfig()

        return true
    }
}
