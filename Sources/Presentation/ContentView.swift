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
    }

    public var body: some View {
        VStack {
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
    }
}

#if canImport(Infrastructure) && DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(settingsRepository: InMemoryUserSettingsRepository())
    }
}
#endif
