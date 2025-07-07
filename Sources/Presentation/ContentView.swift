import SwiftUI
import Domain

public struct ContentView: View {
    @StateObject private var viewModel: SettingsViewModel

    public init(viewModel: SettingsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
    }
}
#endif
