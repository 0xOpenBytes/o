//
//  o+url.swift
//  
//
//  Created by Leif on 3/16/22.
//

import Foundation

public extension o {
    /// Input and Output using URLSession
    enum url {
        public struct DataResponse {
            public let data: Data?
            public let response: URLResponse?

            init(data: Data?, response: URLResponse?) {
                self.data = data
                self.response = response
            }

            init(_ tuple: (Data?, URLResponse?)) {
                self.data = tuple.0
                self.response = tuple.1
            }
        }

        enum HTTPRequestMethod: String {
            case GET
            case HEAD
            case POST
            case PUT
            case DELETE
            case CONNECT
            case OPTIONS
            case TRACE
            case PATCH
        }

        private static func request(
            for url: URL,
            method : HTTPRequestMethod,
            headerFields: [String: String]
        ) -> URLRequest {
            var request = URLRequest(url: url)

            request.httpMethod = method.rawValue
            request.allHTTPHeaderFields = headerFields

            return request
        }
    }
}

// MARK: - Async/ Await

public extension o.url {
    static func `get`(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .GET,
                    headerFields: headerFields
                )
            )
        )
    }

    static func head(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .HEAD,
                    headerFields: headerFields
                )
            )
        )
    }

    static func connect(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .CONNECT,
                    headerFields: headerFields
                )
            )
        )
    }

    static func options(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .OPTIONS,
                    headerFields: headerFields
                )
            )
        )
    }

    static func trace(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .TRACE,
                    headerFields: headerFields
                )
            )
        )
    }

    static func post(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        var request = request(
            for: url,
            method: .POST,
            headerFields: headerFields
        )

        request.httpBody = body

        return DataResponse(
            try await URLSession.shared.data(
                for: request
            )
        )
    }

    static func put(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        var request = request(
            for: url,
            method: .PUT,
            headerFields: headerFields
        )

        request.httpBody = body

        return DataResponse(
            try await URLSession.shared.data(
                for: request
            )
        )
    }

    static func patch(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        var request = request(
            for: url,
            method: .PATCH,
            headerFields: headerFields
        )

        request.httpBody = body

        return DataResponse(
            try await URLSession.shared.data(
                for: request
            )
        )
    }

    static func delete(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8"
        ]
    ) async throws -> DataResponse {
        var request = request(
            for: url,
            method: .DELETE,
            headerFields: headerFields
        )

        request.httpBody = body

        return DataResponse(
            try await URLSession.shared.data(
                for: request
            )
        )
    }
}
