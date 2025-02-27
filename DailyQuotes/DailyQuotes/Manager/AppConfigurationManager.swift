//
//  AppConfigurationManager.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import Combine
import DQCommon
import DQCore

final class AppConfigurationManager {
    static let shared = AppConfigurationManager()

    private var cancellableSet: Set<AnyCancellable> = []

    private init() {}

    func loadCommonConfig() {
        DQCommonConfig.shared.loadConfig()
        loadAPIConfig()
        AppDataManager.shared.appLanguage.loadLanguage()

        configLoading()
        configureAlertMessage()
    }

    private func loadAPIConfig() {
        APIConfig.shared.configure(baseUrl: URLEnvironment(baseUrl: AppDefineConfiguration.baseUrl))
    }

    private func configLoading() {
        let defaultConfig = DefaultLoadingConfiguration()
        defaultConfig.configure()
        LoadingConfiguration.shared.addLoadingConfiguration(loadingType: .defaultLoading, loading: defaultConfig)
    }

    private func configureAlertMessage() {
        let defaultConfiguration = DefaultAlertMessageConfiguration()
        defaultConfiguration.configure()

        AlertMessageConfiguration.shared.addAlertMessage(.defaultAlert, alertMessage: defaultConfiguration)

        let bannerConfig = BannerAlertMessageConfiguration()
        bannerConfig.configure()
        AlertMessageConfiguration.shared.addAlertMessage(.banner, alertMessage: bannerConfig)
    }
}
