//
//  o+url.swift
//  
//
//  Created by Leif on 3/16/22.
//

import Foundation

public extension o {
    /// Input and Output using URLSession
    enum url { }
}

public extension o.url {
    /// GET
    static func `in`<Value: Decodable>(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8"
        ],
        successHandler: @escaping (Value, URLResponse) -> Void,
        errorHandler: @escaping (Error) -> Void = {
            o.console.out($0.localizedDescription)
        },
        noResponseHandler: @escaping () -> Void = {
            o.console.out("No URL Response")
        },
        failureHandler: @escaping (URLResponse) -> Void = {
            o.console.out("No Data (\(dump($0)))")
        },
        decodingErrorHandler: @escaping (Error) -> Void = {
            o.console.out($0.localizedDescription)
        }
    ) {
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headerFields
        
        URLSession.shared
            .dataTask(
                with: request,
                completionHandler: { data, response, error in
                    if let error = error {
                        errorHandler(error)
                    }
                    
                    guard let response = response else {
                        noResponseHandler()
                        return
                    }
                    
                    guard let data = data else {
                        failureHandler(response)
                        return
                    }
                    
                    if let data = data as? Value {
                        successHandler(data, response)
                        return
                    }
                    
                    do {
                        let value = try JSONDecoder()
                            .decode(Value.self, from: data)
                        successHandler(value, response)
                    } catch {
                        decodingErrorHandler(error)
                    }
                }
            )
            .resume()
    }
    
    /// POST
    static func out<Value: Encodable>(
        url: URL,
        value: Value,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8"
        ],
        successHandler: @escaping (Data?, URLResponse?) -> Void,
        errorHandler: @escaping (Error) -> Void = { _ in }
    ) throws {
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(value)
        request.allHTTPHeaderFields = headerFields
        
        URLSession.shared
            .dataTask(
                with: request,
                completionHandler: { data, response, error in
                    if let error = error {
                        errorHandler(error)
                    } else {
                        successHandler(data, response)
                    }
                }
            )
            .resume()
    }
}
