//
//  HomeViewModel.swift
//  DailyQuotes
//
//  Created by dtrognn on 27/2/25.
//

import DQAPILayer

final class HomeViewModel: BaseViewModel {
    @Published var quotes: [QuoteItemViewData] = []
    @Published var authors: [AuthorItemViewData] = []
    @Published var tags: [String] = []
    @Published var tagsSelected: Set<String> = []

    private var isLoadData: Bool = false

    func loadData() {
        if !isLoadData {
            apiGetRandomQuotes()
            apiGetAvailableTags()
            apiGetAvailableAuthors()
            isLoadData = true
        }
    }

    func handleSelectTag(_ tag: String) {
        if tagsSelected.contains(tag) {
            tagsSelected.remove(tag)
        } else {
            tagsSelected.insert(tag)
        }
        apiGetAQuoteByTags()
    }
}

extension HomeViewModel {
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

    private func apiGetAvailableTags() {
        let params = GetAvailableTagsEndpoint.Request()
        GetAvailableTagsEndpoint.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.tags = response ?? []
            }.store(in: &cancellableSet)
    }

    private func apiGetAQuoteByTags() {
        if tagsSelected.isEmpty {
            apiGetRandomQuotes()
            return
        }

        showLoading(true)
        let tags = tagsSelected.joined(separator: ",")
        let params = GetAQuoteByTagsEndpoint.Request(tags: tags)

        GetAQuoteByTagsEndpoint.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showLoading(false)
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.showLoading(false)

                let quote = QuoteItemViewData(response)
                self.quotes = [quote]
            }.store(in: &cancellableSet)
    }

    private func apiGetAvailableAuthors() {
        let params = GetAvailableAuthorsEndpoint.Request()
        GetAvailableAuthorsEndpoint.service.request(parameters: params)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.handleError(error)
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.authors = response.compactMap { data -> AuthorItemViewData in
                    .init(name: data.key, numberOfQuote: data.value)
                }
            }.cancel()
    }
}

private extension QuoteItemViewData {
    init(_ data: GetAQuoteByTagsEndpoint.Response) {
        self.init(id: data.id, author: data.author, tags: data.tags ?? [], quote: data.quote)
    }
}
