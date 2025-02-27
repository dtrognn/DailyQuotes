//
//  API.swift
//  DQCore
//
//  Created by dtrognn on 27/2/25.
//

import Combine
import Foundation

final class API {
    static func call<Request: Endpoint, Response: Codable>(endpoint: Request, parameters: [String: Any]?) -> AnyPublisher<Response, APIError> {
        guard var components = URLComponents(string: APIConfig.shared.urlEnviroment.url) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }

        components.path = endpoint.path

        if let parameters = parameters, endpoint.method == .GET {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }

        guard let url = components.url else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        var headers: [String: String]
        if endpoint.onlyUseHeadersDefault {
            headers = endpoint.headers ?? [:]
        } else {
            headers = generateHeader(endpoint.headers)
        }

        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

        printMessage("======================== API ==========================")
        printMessage("METHOD: \(endpoint.method.rawValue) - URL: \(url)")
        printMessage("Headers: \(headers)")

        if endpoint.method != .GET, let parameters = parameters {
            var bodyComponents = URLComponents()
            bodyComponents.queryItems = parameters.map {
                printMessage("BODY param: \($0.key) - value: \($0.value)")
                return URLQueryItem(name: $0.key, value: "\($0.value)")
            }
            request.httpBody = bodyComponents.query?.data(using: .utf8)
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }

                printMessage("status code: \(httpResponse.statusCode)")
                switch httpResponse.statusCode {
                case 200 ... 299:
                    printFormattedJSON(data: data, type: "RESPONSE")
                    return data
                case 401:
                    throw APIError.invalidToken
                default:
                    throw APIError.unknowned
                }
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .mapError { error -> APIError in
                printMessage("error: \(error.localizedDescription)")
                switch error {
                case is URLError:
                    return .invalidResponse
                case is DecodingError:
                    return .decodingError
                default:
                    return .unknowned
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private static func generateHeader(_ requestHeaders: [String: String]?) -> [String: String] {
        var headers = [String: String]()

        headers[Header.ContentType] = Header.ApplicationJson

        if let requestHeaders = requestHeaders {
            for key in requestHeaders.keys {
                headers[key] = requestHeaders[key]
            }
        }

        return headers
    }

    static func printFormattedJSON(data: Data, type: String) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])

            if let jsonString = String(data: jsonData, encoding: .utf8) {
                printMessage("\(type) => \(jsonString)")
            }
        } catch {
            printMessage("Failed to format JSON: \(error.localizedDescription)")
        }
    }

    private static func printMessage(_ message: String) {
        #if DEBUG
            print("API => \(message)")
        #endif
    }
}
