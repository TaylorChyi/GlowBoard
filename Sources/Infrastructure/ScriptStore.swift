import Foundation
import Domain

public final class InMemoryScriptRepository: ScriptRepository {
    private var scripts: [UUID: Script]

    public init(scripts: [Script] = []) {
        self.scripts = Dictionary(uniqueKeysWithValues: scripts.map { ($0.id, $0) })
    }

    public func fetchScripts() -> [Script] {
        Array(scripts.values)
    }

    public func save(script: Script) {
        scripts[script.id] = script
    }

    public func delete(id: UUID) {
        scripts[id] = nil
    }
}
