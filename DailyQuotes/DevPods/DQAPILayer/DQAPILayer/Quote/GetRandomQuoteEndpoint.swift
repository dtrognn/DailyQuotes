//
//  GetRandomQuoteEndpoint.swift
//  DQAPILayer
//
//  Created by dtrognn on 27/2/25.
//

import DQCore
import Foundation

public struct GetRandomQuoteEndpoint: Endpoint {
    public static let service = GetRandomQuoteEndpoint()

    public var path: String = "/api/quotes/random"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public init() {}
    }

    public struct Response: Codable {
        public let id: Int
        public let author: String
        public let tags: [String]?
        public let quote: String
    }
}
