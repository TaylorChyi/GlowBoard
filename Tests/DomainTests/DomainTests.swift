import XCTest
@testable import Domain

final class DomainTests: XCTestCase {
    func testWordCount() throws {
        let script = Script(text: "Hello world from GlowBoard")
        XCTAssertEqual(script.wordCount(), 4)
    }
    func testDisplaySettingsInitialization() throws {
        let color = RGBAColor(red: 1, green: 0, blue: 0)
        let settings = DisplaySettings(backgroundColor: color)
        XCTAssertEqual(settings.backgroundColor, color)
    }

}

