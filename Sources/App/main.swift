import SwiftUI
import Presentation
import Infrastructure
import Domain

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
        }
    }
}
