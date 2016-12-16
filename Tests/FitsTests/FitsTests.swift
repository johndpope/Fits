import XCTest
@testable import Fits

class FitsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Fits().text, "Hello, World!")
    }


    static var allTests : [(String, (FitsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
