import Domain
#if canImport(SwiftUI)
import SwiftUI
import Domain

public struct ContentView: View {
    @State private var script = Script(text: "GlowBoard Placeholder")
    private let availableFonts = ["System", "Helvetica Neue", "Courier", "Times New Roman"]

    public init() {}

    public var body: some View {
        VStack {
            Text(script.text)
                .font(font(for: script.font.fontName))
                .padding()

            Picker("Font", selection: $script.font.fontName) {
                ForEach(availableFonts, id: \.self) { name in
                    Text(name).tag(name)
                }
            }
            .pickerStyle(.menu)
            .padding()
        }
    }

    private func font(for name: String) -> Font {
        if name == "System" {
            return .system(size: 24)
        } else {
            return .custom(name, size: 24)
    @StateObject private var viewModel: SettingsViewModel

    public init(repository: SettingsRepository) {
        _viewModel = StateObject(wrappedValue: SettingsViewModel(repository: repository))
    }

    public var body: some View {
        VStack {
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
    static var previews: some View {
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
