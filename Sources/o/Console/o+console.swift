//
//  o+console.swift
//  
//
//  Created by Leif on 3/16/22.
//

public extension o {
    /// Input and Output using the console
    enum console { }
}

public extension o.console {
    /// Read a string from the console
    static func `in`() -> String? { readLine() }
    
    /// Print the value. Reports the file, line, and function that calls this function.
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
