//
//  AppDataManager.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import Foundation

final class AppDataManager {
    static let shared = AppDataManager()

    let appLanguage: AppLanguage

    init() {
        appLanguage = AppLanguage()
    }
}
