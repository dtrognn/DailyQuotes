//
//  GetQuotesByAuthorEndpoint.swift
//  DQAPILayer
//
//  Created by dtrognn on 2/3/25.
//

import DQCore
import Foundation

public struct GetQuotesByAuthorEndpoint: Endpoint {
    public static var service = GetQuotesByAuthorEndpoint()

    public var path: String = ""
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public let authors: String

        public init(authors: String) {
            self.authors = authors
        }
    }

    public struct Response: Codable {
        public let id: Int
        public let author: String
        public let tags: [String]?
        public let quote: String
    }
}
