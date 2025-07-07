import Foundation
#if canImport(SwiftUI)
import SwiftUI
import Presentation
import Infrastructure
import Domain
#endif

#if canImport(SwiftUI)
@main
struct GlowBoardApp: App {
    private let repository = InMemoryScriptRepository(
        scripts: [Script(text: "Welcome to GlowBoard. This sample text demonstrates scrolling subtitles.")]
    )

    var body: some Scene {
        WindowGroup {
            if let script = repository.fetchScripts().first {
                ContentView(script: script)
            } else {
                ContentView(script: Script(text: ""))
            }

    private let settingsRepository = InMemoryUserSettingsRepository()

    var body: some Scene {
        WindowGroup {
            ContentView(settingsRepository: settingsRepository)
    private let settingsRepository = InMemorySettingsRepository()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SettingsViewModel(repository: settingsRepository))
    var body: some Scene {
        WindowGroup {
            ContentView(repository: settingsRepository)
    private let repository = InMemoryScriptRepository(
        scripts: [Script(text: "Welcome to GlowBoard. This sample text demonstrates scrolling subtitles.")]
    )

    var body: some Scene {
        WindowGroup {
            let repository = InMemoryScriptRepository()
            ContentView(viewModel: ScriptViewModel(repository: repository))
        }
    }
}
#else
@main
enum GlowBoardApp {
    static func main() {
        // Empty main for non-SwiftUI platforms
    }
}
#endif
