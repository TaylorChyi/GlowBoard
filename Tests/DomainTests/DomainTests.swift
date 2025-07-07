import XCTest
@testable import Domain
@testable import Infrastructure

final class DomainTests: XCTestCase {
    func testWordCount() throws {
        let script = Script(text: "Hello world from GlowBoard")
        XCTAssertEqual(script.wordCount(), 4)
    }

    func testSettingsRepositoryStoresColor() throws {
        let repository = InMemorySettingsRepository()
        var settings = repository.load()
        XCTAssertEqual(settings.textColor, .white)

        let newColor = RGBAColor(red: 0, green: 0, blue: 1)
        settings.textColor = newColor
        repository.save(settings)

        let loaded = repository.load()
        XCTAssertEqual(loaded.textColor, newColor)
    }
    func testDisplaySettingsInitialization() throws {
        let color = RGBAColor(red: 1, green: 0, blue: 0)
        let settings = DisplaySettings(backgroundColor: color)
        XCTAssertEqual(settings.backgroundColor, color)
    }

}

