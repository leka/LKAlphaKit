import XCTest
@testable import LKAlphaKit

final class LKAlphaKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LKAlphaKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
