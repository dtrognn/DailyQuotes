//
//  DQCommonConfig.swift
//  DQCommon
//
//  Created by dtrognn on 27/2/25.
//

import Foundation

public class DQCommonConfig {
    private init() {}

    public static let shared = DQCommonConfig()

    public func loadConfig() {
        LanguageLocal.shared.loadLanguage()
    }
}
