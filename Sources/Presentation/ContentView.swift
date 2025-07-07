import Domain
#if canImport(SwiftUI)
import SwiftUI
import Domain
#if canImport(Infrastructure)
import Infrastructure
#endif

public struct ContentView: View {
    private let settingsRepository: UserSettingsRepository
    @State private var fontSize: Double

    public init(settingsRepository: UserSettingsRepository) {
        self.settingsRepository = settingsRepository
        self._fontSize = State(initialValue: settingsRepository.loadSettings().fontSize)

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

    private let provider: LocalizedStringProvider
    public init(provider: LocalizedStringProvider = LocalizationService()) {
        self.provider = provider
    }
    public var body: some View {
        Text(provider.localizedString(forKey: "placeholder_text"))
            .padding()
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
            Text("Sample Script")
                .font(.system(size: fontSize))
                .padding()

            Slider(value: $fontSize, in: 12...72, step: 1) {
                Text("Font Size")
            }
            .onChange(of: fontSize) { newValue in
                var settings = settingsRepository.loadSettings()
                settings.fontSize = newValue
                settingsRepository.save(settings: settings)
            }
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

#if canImport(Infrastructure) && DEBUG
struct ContentView_Previews: PreviewProvider {
    private class PreviewRepository: SettingsRepository {
        func load() -> UserSettings { UserSettings() }
        func save(_ settings: UserSettings) {}
    }

    static var previews: some View {
        ContentView(viewModel: SettingsViewModel(repository: PreviewRepository()))
        ContentView(settingsRepository: InMemoryUserSettingsRepository())
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
