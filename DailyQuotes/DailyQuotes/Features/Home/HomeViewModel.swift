//
//  HomeViewModel.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import DQAPILayer

final class HomeViewModel: BaseViewModel {
    @Published var quotes: [QuoteItemViewData] = []
    private var isLoadData: Bool = false

    func loadData() {
        if !isLoadData {
            apiGetRandomQuotes()
            isLoadData = true
        }
    }

    private func apiGetRandomQuotes() {
        showLoading(true)
        let params = GetRandomQuotesEndpoint.Request()
        GetRandomQuotesEndpoint.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.showLoading(false)

                self.quotes = response.map { .init($0) }
            }.store(in: &cancellableSet)
    }
}
