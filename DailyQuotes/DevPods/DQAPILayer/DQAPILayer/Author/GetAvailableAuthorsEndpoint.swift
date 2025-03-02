//
//  GetAvailableAuthorsEndpoint.swift
//  DQAPILayer
//
//  Created by dtrognn on 2/3/25.
//

import DQCore
import Foundation

public struct GetAvailableAuthorsEndpoint: Endpoint {
    public static var service = GetAvailableAuthorsEndpoint()

    public var path: String = "/api/authors"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public init() {}
    }

    public typealias Response = [String: Int]
}
