//
//  o+file.swift
//  
//
//  Created by Leif on 3/16/22.
//

import Foundation

public extension o {
    enum file { }
}

public extension o.file {
    static var documentDirectoryURL: URL { FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] }
    
    static func `in`<Value: Decodable>(
        filename: String
    ) throws -> Value {
        try JSONDecoder().decode(Value.self, from: data(filename: filename))
    }
    
    static func data(
        filename: String
    ) throws -> Data {
        let fileData = try Data(contentsOf: documentDirectoryURL.appendingPathComponent(filename))
        
        guard let base64DecodedData = Data(base64Encoded: fileData) else {
            return fileData
        }
        
        return base64DecodedData
    }
    
    static func out<Value: Encodable>(
        _ value: Value,
        filename: String
    ) throws {
        try JSONEncoder()
            .encode(value)
            .base64EncodedData()
            .write(to: documentDirectoryURL.appendingPathComponent(filename))
    }
    
    static func delete(
        filename: String
    ) throws {
        try FileManager.default.removeItem(at: documentDirectoryURL.appendingPathComponent(filename))
    }
}
