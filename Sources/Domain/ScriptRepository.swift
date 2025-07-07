import Foundation

public protocol ScriptRepository {
    func fetchScripts() -> [Script]
    func save(script: Script)
    func delete(id: UUID)
}
