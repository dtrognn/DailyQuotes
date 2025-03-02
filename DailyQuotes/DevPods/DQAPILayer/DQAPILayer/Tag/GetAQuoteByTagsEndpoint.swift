//
//  GetAQuoteByTagsEndpoint.swift
//  DQAPILayer
//
//  Created by dtrognn on 28/2/25.
//

import DQCore
import Foundation

public struct GetAQuoteByTagsEndpoint: Endpoint {
//    public static func service(_ tags: String) -> GetAQuoteByTagsEndpoint {
//        var service = GetAQuoteByTagsEndpoint()
//        service.path = String(format: service.path, tags)
//        return service
//    }

    public static var service = GetAQuoteByTagsEndpoint()

    public var path: String = "/api/quotes/random"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public let tags: String

        public init(tags: String) {
            self.tags = tags
        }
    }

    public struct Response: Codable {
        public let id: Int
        public let author: String
        public let tags: [String]?
        public let quote: String
    }
}
