import XCTest
import Infrastructure
import Domain

final class SettingsRepositoryTests: XCTestCase {
    func testSaveAndFetch() throws {
        let repo = InMemorySettingsRepository()
        let color = RGBAColor(red: 0.5, green: 0.5, blue: 0.5)
        repo.save(settings: DisplaySettings(backgroundColor: color))
        XCTAssertEqual(repo.fetchSettings().backgroundColor, color)
    }
}
