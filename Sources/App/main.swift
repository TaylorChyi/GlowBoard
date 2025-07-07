import SwiftUI
import Presentation
import Infrastructure
import Domain

@main
struct GlowBoardApp: App {
    private let settingsRepository = InMemoryUserSettingsRepository()

    var body: some Scene {
        WindowGroup {
            ContentView(settingsRepository: settingsRepository)
        }
    }
}
