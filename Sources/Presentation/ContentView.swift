import Domain
#if canImport(SwiftUI)
import SwiftUI
import Domain

public struct ContentView: View {
    @StateObject private var viewModel: SettingsViewModel

    public init(viewModel: SettingsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    public init(repository: SettingsRepository) {
        _viewModel = StateObject(wrappedValue: SettingsViewModel(repository: repository))
    }

    public var body: some View {
        VStack {
            Text("GlowBoard Placeholder")
                .foregroundColor(Color(rgbaColor: viewModel.settings.textColor))
                .padding()
            ColorPicker(
                "Text Color",
                selection: Binding(
                    get: { Color(rgbaColor: viewModel.settings.textColor) },
                    set: { viewModel.updateTextColor($0.toRGBAColor()) }
                )
            )
            .padding()
        }
            ColorPicker("Background Color", selection: $viewModel.backgroundColor)
                .padding()
            Text("GlowBoard Placeholder")
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(viewModel.backgroundColor)
        .onChange(of: viewModel.backgroundColor) { newColor in
            viewModel.updateBackgroundColor(newColor)
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
    private class PreviewRepository: SettingsRepository {
        func load() -> UserSettings { UserSettings() }
        func save(_ settings: UserSettings) {}
    }

    static var previews: some View {
        ContentView(viewModel: SettingsViewModel(repository: PreviewRepository()))
        ContentView(repository: InMemorySettingsRepository())
        ContentView(viewModel: ScriptViewModel(repository: InMemoryScriptRepository()))
    }
}
#endif
#else
public struct ContentView {
    public init(viewModel: ScriptViewModel) {}
}
#endif
