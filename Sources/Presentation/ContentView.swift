import Domain
#if canImport(SwiftUI)
import SwiftUI
import Domain

public struct ContentView: View {
    private let provider: LocalizedStringProvider
    public init(provider: LocalizedStringProvider = LocalizationService()) {
        self.provider = provider
    }
    public var body: some View {
        Text(provider.localizedString(forKey: "placeholder_text"))
            .padding()
    @StateObject private var viewModel: ScriptViewModel
    @State private var showingEditor = false

    public init(viewModel: ScriptViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.scripts) { script in
                    Text(script.text)
                        .lineLimit(1)
                }
                .onDelete(perform: viewModel.deleteScripts)
            }
            .navigationTitle("Scripts")
            .toolbar {
                Button(action: { showingEditor = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingEditor) {
                ScriptEditorView { text in
                    viewModel.addScript(text: text)
                }
            }
        }
    }
} 

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ScriptViewModel(repository: InMemoryScriptRepository()))
    }
}
#endif
#else
public struct ContentView {
    public init(viewModel: ScriptViewModel) {}
}
#endif
