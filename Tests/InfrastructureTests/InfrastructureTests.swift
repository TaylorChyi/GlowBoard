import XCTest
import Domain
import Infrastructure

final class InfrastructureTests: XCTestCase {
    func testFetchScriptsReturnsStoredScripts() throws {
        let scripts = [Script(text: "sample")]
        let repository = InMemoryScriptRepository(scripts: scripts)
        XCTAssertEqual(repository.fetchScripts().count, 1)
        XCTAssertEqual(repository.fetchScripts().first?.text, "sample")
    }
}
