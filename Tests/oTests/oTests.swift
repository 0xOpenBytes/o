import XCTest
@testable import o

final class oTests: XCTestCase {
    func testExample() throws {
        let filename = "SomeNumber"
        try? o.file.out(4, filename: filename)
        XCTAssertNoThrow(try o.file.in(filename: filename) as Int)
        XCTAssertEqual(try? o.file.in(filename: filename), 4)
        try o.file.delete(filename: filename)
        XCTAssertThrowsError(try o.file.in(filename: filename) as Int)
    }
}
