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
            "Content-Type": "application/json; charset=utf-8"
        ]
    ) async throws -> (Data?, URLResponse?) {
        try await URLSession.shared.data(
            for: request(
                for: url,
                method: .GET,
                headerFields: headerFields
            )
        )
    }

    static func head(
        url: URL,
        headerFields: [String: String]
    ) async throws -> URLResponse? {
        try await URLSession.shared.data(
            for: request(
                for: url,
                method: .HEAD,
                headerFields: headerFields
            )
        ).1
    }

    static func connect(
        url: URL,
        headerFields: [String: String]
    ) async throws -> (Data?, URLResponse?) {
        try await URLSession.shared.data(
            for: request(
                for: url,
                method: .CONNECT,
                headerFields: headerFields
            )
        )
    }

    static func options(
        url: URL,
        headerFields: [String: String]
    ) async throws -> (Data?, URLResponse?) {
        try await URLSession.shared.data(
            for: request(
                for: url,
                method: .OPTIONS,
                headerFields: headerFields
            )
        )
    }

    static func trace(
        url: URL,
        headerFields: [String: String]
    ) async throws -> URLResponse? {
        try await URLSession.shared.data(
            for: request(
                for: url,
                method: .TRACE,
                headerFields: headerFields
            )
        ).1
    }

    static func post(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8"
        ]
    ) async throws -> (Data?, URLResponse?) {
        var request = request(
            for: url,
            method: .POST,
            headerFields: headerFields
        )

        request.httpBody = body

        return try await URLSession.shared.data(
            for: request
        )
    }

    static func put(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8"
        ]
    ) async throws -> URLResponse? {
        var request = request(
            for: url,
            method: .PUT,
            headerFields: headerFields
        )

        request.httpBody = body

        return try await URLSession.shared.data(
            for: request
        ).1
    }

    static func patch(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8"
        ]
    ) async throws -> (Data?, URLResponse?) {
        var request = request(
            for: url,
            method: .PATCH,
            headerFields: headerFields
        )

        request.httpBody = body

        return try await URLSession.shared.data(
            for: request
        )
    }

    static func delete(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8"
        ]
    ) async throws -> (Data?, URLResponse?) {
        var request = request(
            for: url,
            method: .DELETE,
            headerFields: headerFields
        )

        request.httpBody = body

        return try await URLSession.shared.data(
            for: request
        )
    }
}
