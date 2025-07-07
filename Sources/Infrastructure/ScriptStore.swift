import Foundation
import Domain

public struct InMemoryScriptRepository: ScriptRepository {
    private var scripts: [Script]

    public init(scripts: [Script] = []) {
        self.scripts = scripts
    }

    public func fetchScripts() -> [Script] {
        scripts
    }
}
