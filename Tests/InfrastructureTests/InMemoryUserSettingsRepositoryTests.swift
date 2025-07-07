import XCTest
@testable import Infrastructure
@testable import Domain

final class InMemoryUserSettingsRepositoryTests: XCTestCase {
    func testSaveAndLoadFontSize() {
        let repo = InMemoryUserSettingsRepository()
        var settings = repo.loadSettings()
        XCTAssertEqual(settings.fontSize, 24)
        settings.fontSize = 30
        repo.save(settings: settings)
        let loaded = repo.loadSettings()
        XCTAssertEqual(loaded.fontSize, 30)
    }
}
