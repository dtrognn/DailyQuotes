//
//  QuoteItemData.swift
//  DQAPILayer
//
//  Created by dtrognn on 28/2/25.
//

import Foundation

public struct QuoteItemData: Codable {
    public let id: Int
    public let author: String
    public let length: Int?
    public let tags: [String]?
    public let quote: String
}
