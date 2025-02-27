//
//  BaseViewModel.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import Combine
import DQCommon
import DQCore

open class BaseViewModel: ObservableObject {
    var cancellableSet: Set<AnyCancellable> = []

    init() {
        initData()
        makeSubscription()
    }

    open func initData() {

    }

    open func makeSubscription() {

    }

    func handleError(_ error: Subscribers.Completion<APIError>) {
        switch error {
        case .finished:
            break
        case .failure:
            showErrorMessage(language("Error_A_01"))
        }
    }

    open func showLoading(_ isLoading: Bool) {
        LoadingConfiguration.shared.showLoading(isLoading)
    }

    func showErrorMessage(_ errorMessage: String) {
        AlertMessageConfiguration.shared.showMessage(errorMessage, alertMessageType: .banner)
    }

    func showSuccessMessage(_ message: String) {
        AlertMessageConfiguration.shared.showMessage(message, alertMessageType: .banner, style: .success)
    }
}
