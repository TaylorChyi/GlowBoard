import Foundation
import Domain

#if canImport(Combine)
import Combine
#else
@propertyWrapper
public struct Published<Value> {
    public var wrappedValue: Value
    public init(wrappedValue: Value) { self.wrappedValue = wrappedValue }
}

public protocol ObservableObject {}
#endif

public final class ScriptViewModel: ObservableObject {
    @Published public private(set) var scripts: [Script] = []
    private let repository: ScriptRepository

    public init(repository: ScriptRepository) {
        self.repository = repository
        scripts = repository.fetchScripts()
    }

    public func addScript(text: String) {
        let script = Script(text: text)
        repository.save(script: script)
        scripts = repository.fetchScripts()
    }

    public func deleteScripts(at offsets: IndexSet) {
        for index in offsets {
            let script = scripts[index]
            repository.delete(id: script.id)
        }
        scripts = repository.fetchScripts()
    }
}
