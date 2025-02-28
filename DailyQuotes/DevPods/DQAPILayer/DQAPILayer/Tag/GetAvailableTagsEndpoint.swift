//
//  GetAvailableTagsEndpoint.swift
//  DQAPILayer
//
//  Created by dtrognn on 28/2/25.
//

import DQCore
import Foundation

public struct GetAvailableTagsEndpoint: Endpoint {
    public static let service = GetAvailableTagsEndpoint()

    public var path: String = "/api/tags"
    public var method: HTTPMethod = .GET
    public var headers: [String: String]? = nil

    public struct Request: Codable {
        public init() {}
    }

    public typealias Response = [String]?
}
