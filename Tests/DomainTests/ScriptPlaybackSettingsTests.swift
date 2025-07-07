import XCTest
@testable import Domain

final class ScriptPlaybackSettingsTests: XCTestCase {
    func testDefaultIsNotMirrored() {
        let settings = ScriptPlaybackSettings()
        XCTAssertFalse(settings.isMirrored)
    }

    func testCustomInit() {
        let settings = ScriptPlaybackSettings(isMirrored: true)
        XCTAssertTrue(settings.isMirrored)
    }
}
