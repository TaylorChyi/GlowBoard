import XCTest
@testable import Infrastructure
@testable import Domain

final class InMemorySettingsRepositoryTests: XCTestCase {
    func testSaveAndLoadFontSize() {
        let repo = InMemorySettingsRepository()
        var settings = repo.load()
        XCTAssertEqual(settings.fontSize, 24)
        settings.fontSize = 30
        repo.save(settings)
        let loaded = repo.load()
        XCTAssertEqual(loaded.fontSize, 30)
    }
}
