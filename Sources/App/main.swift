import SwiftUI
import Presentation
import Infrastructure
import Domain

@main
struct GlowBoardApp: App {
    private let settingsRepository = InMemorySettingsRepository()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SettingsViewModel(repository: settingsRepository))
        }
    }
}
