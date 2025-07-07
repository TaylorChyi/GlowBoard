import XCTest
@testable import Domain

final class DomainTests: XCTestCase {
    func testWordCount() throws {
        let script = Script(text: "Hello world from GlowBoard")
        XCTAssertEqual(script.wordCount(), 4)
    }

    func testFontName() throws {
        let script = Script(text: "Test", font: FontSetting(fontName: "Helvetica"))
        XCTAssertEqual(script.font.fontName, "Helvetica")
    }
}
