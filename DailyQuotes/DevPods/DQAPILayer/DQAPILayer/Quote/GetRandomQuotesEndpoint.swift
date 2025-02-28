//
//  GetRandomQuotesEndpoint.swift
//  DQAPILayer
//
//  Created by dtrognn on 28/2/25.
//

import DQCore
import Foundation

public struct GetRandomQuotesEndpoint: Endpoint {
    public static let service = GetRandomQuotesEndpoint()

    public var path: String = "/api/quotes/random"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public let count: Int

        public init(count: Int = 50) {
            self.count = count
        }
    }

    public typealias Response = [QuoteItemData]
}
