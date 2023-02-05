//
//  o+file.swift
//  
//
//  Created by Leif on 3/16/22.
//

import Foundation

public extension o {
    /// The `o` namespace for Input and Output using `FileManager`.
    enum file { }
}

public extension o.file {
    /// The `FileManager` instance to use.
    static var fileManager: FileManager {
        FileManager.default
    }

    /// The current directory path.
    static var currentDirectoryPath: String {
        fileManager.currentDirectoryPath
    }

    /// Creates a directory at the specified path.
    ///
    /// - Parameters:
    ///   - path: The path at which to create the directory.
    /// - Throws: An error if the directory could not be created.
    static func createDirectory(path: String) throws {
        try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true)
    }

    /// Returns the contents of the directory at the specified URL, including the specified properties.
    ///
    /// - Parameters:
    ///   - url: The URL of the directory.
    ///   - keys: The properties to include for each item.
    ///   - mask: The options for enumerating the directory.
    /// - Returns: An array of URLs for the contents of the directory.
    /// - Throws: An error if the contents could not be retrieved.
    static func contentsOfDirectory(
        at url: URL,
        includingPropertiesForKeys keys: [URLResourceKey]?,
        options mask: FileManager.DirectoryEnumerationOptions = []
    ) throws -> [URL] {
        try fileManager.contentsOfDirectory(
            at: url,
            includingPropertiesForKeys: keys,
            options: mask
        )
    }

    /// Returns the contents of the directory at the specified path.
    ///
    /// - Parameters:
    ///   - path: The path of the directory.
    /// - Returns: An array of strings for the contents of the directory.
    /// - Throws: An error if the contents could not be retrieved.
    static func contentsOfDirectory(atPath path: String) throws -> [String] {
        try fileManager.contentsOfDirectory(atPath: path)
    }

    /// Removes the item at the specified path.
    ///
    /// - Parameters:
    ///   - path: The path of the item to remove.
    /// - Throws: An error if the item could not be removed.
    static func removeItem(atPath path: String) throws {
        try fileManager.removeItem(atPath: path)
    }

    /// Determines whether a file exists at the specified path.
    ///
    /// - Parameters:
    ///   - path: The path of the file.
    /// - Returns: `true` if the file exists, `false` otherwise.
    /// - Throws: An error if the file existence could not be determined.
    static func fileExists(atPath path: String) throws -> Bool {
        fileManager.fileExists(atPath: path)
    }

    /// Read a file's data as the type `Value`
    ///
    /// - Parameters:
    ///   - path: The path to the directory containing the file. The default is `.`, which means the current working directory.
    ///   - filename: The name of the file to read.
    /// - Returns: The file's data decoded as an instance of `Value`.
    /// - Throws: If there's an error reading the file or decoding its data.
    static func `in`<Value: Decodable>(
        path: String = ".",
        filename: String
    ) throws -> Value {
        let data = try data(
            path: path,
            filename: filename
        )

        return try JSONDecoder().decode(Value.self, from: data)
    }

    /// Read a file's data as the type `String`
    ///
    /// - Parameters:
    ///   - path: The path to the directory containing the file. The default is `.`, which means the current working directory.
    ///   - filename: The name of the file to read.
    ///   - encoding: The String.Encoding to use to get the string.
    /// - Returns: The file's data decoded as an instance of `String`.
    /// - Throws: If there's an error reading the file or decoding its data.
    static func string(
        path: String = ".",
        filename: String,
        encoding: String.Encoding = .utf8
    ) throws -> String? {
        let data = try data(
            path: path,
            filename: filename
        )

        return String(data: data, encoding: encoding)
    }
    
    /// Read a file's data
    ///
    /// - Parameters:
    ///   - path: The path to the directory containing the file. The default is `.`, which means the current working directory.
    ///   - filename: The name of the file to read.
    /// - Returns: The file's data.
    /// - Throws: If there's an error reading the file.
    static func data(
        path: String = ".",
        filename: String
    ) throws -> Data {
        let directoryURL = URL(fileURLWithPath: path)

        let fileData = try Data(
            contentsOf: directoryURL.appendingPathComponent(filename)
        )
        
        guard let base64DecodedData = Data(base64Encoded: fileData) else {
            return fileData
        }
        
        return base64DecodedData
    }
    
    /// Write data to a file using a JSONEncoder
    ///
    /// - Parameters:
    ///   - value: The data to write to the file. It must conform to the `Encodable` protocol.
    ///   - path: The path to the directory where the file should be written. The default is `.`, which means the current working directory.
    ///   - filename: The name of the file to write.
    ///   - base64Encoded: A Boolean value indicating whether the data should be Base64-encoded before writing to the file. The default is `true`.
    /// - Throws: If there's an error writing the data to the file.
    static func out<Value: Encodable>(
        _ value: Value,
        path: String = ".",
        filename: String,
        base64Encoded: Bool = true
    ) throws {
        let directoryURL = URL(fileURLWithPath: path)

        var data = try JSONEncoder().encode(value)
        
        try out(
            data: data,
            path: path,
            filename: filename,
            base64Encoded: base64Encoded
        )
    }

    /// Write a string to a file
    ///
    /// - Parameters:
    ///   - string: The string to write to the file.
    ///   - path: The path to the directory where the file should be written. The default is `.`, which means the current working directory.
    ///   - filename: The name of the file to write.
    ///   - using: The String.Encoding to encode the string with. The default is `.utf8`.
    ///   - base64Encoded: A Boolean value indicating whether the data should be Base64-encoded before writing to the file. The default is `true`.
    /// - Throws: If there's an error writing the data to the file.
    static func out(
        string: String,
        path: String = ".",
        filename: String,
        using stringEncoding: String.Encoding = .utf8,
        base64Encoded: Bool = true
    ) throws {
        let directoryURL = URL(fileURLWithPath: path)

        var data = string.data(using: stringEncoding) ?? Data()

        try out(
            data: data,
            path: path,
            filename: filename,
            base64Encoded: base64Encoded
        )
    }

    /// Write data to a file
    ///
    /// - Parameters:
    ///   - value: The data to write to the file.
    ///   - path: The path to the directory where the file should be written. The default is `.`, which means the current working directory.
    ///   - filename: The name of the file to write.
    ///   - base64Encoded: A Boolean value indicating whether the data should be Base64-encoded before writing to the file. The default is `true`.
    /// - Throws: If there's an error writing the data to the file.
    static func out(
        data: Data,
        path: String = ".",
        filename: String,
        base64Encoded: Bool = true
    ) throws {
        let directoryURL = URL(fileURLWithPath: path)

        var data = data

        if base64Encoded {
            data = data.base64EncodedData()
        }

        try data.write(
            to: directoryURL.appendingPathComponent(filename)
        )
    }
    
    /// Delete a file
    ///
    /// - Parameters:
    ///   - path: The path to the directory containing the file. The default is `.`, which means the current working directory.
    ///   - filename: The name of the file to delete.
    /// - Throws: If there's an error deleting the file.
    static func delete(
        path: String = ".",
        filename: String
    ) throws {
        let directoryURL = URL(fileURLWithPath: path)

        try fileManager.removeItem(
            at: directoryURL.appendingPathComponent(filename)
        )
    }
}
