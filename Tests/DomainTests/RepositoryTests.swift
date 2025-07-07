import XCTest
@testable import Domain
@testable import Infrastructure

final class RepositoryTests: XCTestCase {
    func testSaveAndDeleteScript() {
        let repository = InMemoryScriptRepository()
        let script = Script(text: "Example")
        repository.save(script: script)
        XCTAssertEqual(repository.fetchScripts().count, 1)
        repository.delete(id: script.id)
        XCTAssertTrue(repository.fetchScripts().isEmpty)
    }
}
