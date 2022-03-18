//
//  o+console.swift
//  
//
//  Created by Leif on 3/16/22.
//

public extension o {
    enum console { }
}

public extension o.console {
    static func `in`() -> String? { readLine() }
    
    static func out(
        _ value: Any...,
        separator: String = " ",
        terminator: String = "\n",
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) {
        print("(\(file)@\(line)) [\(function)]: \(value)", separator: separator, terminator: terminator)
    }
}
