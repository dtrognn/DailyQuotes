//
//  AuthorItemViewData.swift
//  DailyQuotes
//
//  Created by dtrognn on 2/3/25.
//

import Foundation

struct AuthorItemViewData: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let numberOfQuote: Int

    init(name: String, numberOfQuote: Int) {
        self.name = name
        self.numberOfQuote = numberOfQuote
    }
}
