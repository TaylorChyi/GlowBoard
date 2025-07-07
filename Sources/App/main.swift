import Domain
#if canImport(SwiftUI)
import SwiftUI
import Presentation
import Infrastructure

@main
struct GlowBoardApp: App {
    private let scriptRepository = InMemoryScriptRepository(
        scripts: [Script(text: "Welcome to GlowBoard. This sample text demonstrates scrolling subtitles.")]
    )
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ScriptViewModel(repository: scriptRepository))
        }
    }
}
#else
@main
enum GlowBoardApp {
    static func main() {
        // Non-SwiftUI platforms are not supported in tests
    }
}
#endif
