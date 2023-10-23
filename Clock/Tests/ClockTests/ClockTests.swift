import XCTest
@testable import Clock

final class ClockTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Clock().text, "Hello, World!")
    }
}
