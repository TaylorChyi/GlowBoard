import Foundation

public protocol ScriptRepository {
    func fetchScripts() -> [Script]
}
