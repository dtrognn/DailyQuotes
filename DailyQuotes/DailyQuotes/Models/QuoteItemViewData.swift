//
//  QuoteItemViewData.swift
//  DailyQuotes
//
//  Created by dtrognn on 28/2/25.
//

import DQAPILayer
import SwiftUI

struct QuoteItemViewData: Identifiable {
    var id: Int
    var author: String
    var tags: [String]
    var quote: String

    init(id: Int, author: String, tags: [String], quote: String) {
        self.id = id
        self.author = author
        self.tags = tags
        self.quote = quote
    }

    init(_ quote: QuoteItemData) {
        self.id = quote.id
        self.author = quote.author
        self.tags = quote.tags ?? []
        self.quote = quote.quote
    }

    var linearGradient: LinearGradient {
        return SentimentPolarityManager.shared.generateLinearGradient(quote: quote)
    }
}
