import XCTest
@testable import o

final class oTests: XCTestCase {
    func testExample() throws {
        let fileContents = Double.pi
        let filename = "SomeNumber"
        let folderPath = "./TestFolder"

        XCTAssertThrowsError(try o.file.contentsOfDirectory(atPath: folderPath))

        XCTAssertFalse(try o.file.fileExists(atPath: folderPath))
        try o.file.createDirectory(path: folderPath)
        XCTAssertTrue(try o.file.fileExists(atPath: folderPath))

        XCTAssertEqual(try o.file.contentsOfDirectory(atPath: folderPath).count, 0)

        XCTAssertFalse(try o.file.fileExists(atPath: "\(folderPath)/\(filename)"))
        try o.file.out(fileContents, path: folderPath, filename: filename, base64Encoded: false)
        XCTAssertTrue(try o.file.fileExists(atPath: "\(folderPath)/\(filename)"))

        XCTAssertEqual(try o.file.contentsOfDirectory(atPath: folderPath).count, 1)

        XCTAssertEqual(try o.file.in(path: folderPath, filename: filename), Double.pi)

        // Remove

        try o.file.delete(path: folderPath, filename: filename)
        XCTAssertFalse(try o.file.fileExists(atPath: "\(folderPath)/\(filename)"))

        XCTAssertEqual(try o.file.contentsOfDirectory(atPath: folderPath).count, 0)

        try o.file.removeItem(atPath: folderPath)
        XCTAssertFalse(try o.file.fileExists(atPath: folderPath))
    }

    func testStrings() throws {
        let fileContents = "Hello, World"
        let filename = "SomeNumber"


        XCTAssertFalse(try o.file.fileExists(atPath: filename))
        try o.file.out(string: fileContents, filename: filename, base64Encoded: false)
        XCTAssertTrue(try o.file.fileExists(atPath: filename))


        XCTAssertEqual(try o.file.string(filename: filename), "Hello, World")

        // Remove

        try o.file.delete(filename: filename)
        XCTAssertFalse(try o.file.fileExists(atPath: filename))
    }
}
