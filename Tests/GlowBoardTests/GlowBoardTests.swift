import XCTest
@testable import GlowBoard

final class GlowBoardTests: XCTestCase {
    func testWordCount() throws {
        let script = Script(text: "Hello world from GlowBoard")
        XCTAssertEqual(script.wordCount(), 4)
    }
}
