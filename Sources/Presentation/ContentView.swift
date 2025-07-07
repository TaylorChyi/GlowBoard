import SwiftUI
import Domain

public struct ContentView: View {
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
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(repository: InMemorySettingsRepository())
    }
}
#endif
