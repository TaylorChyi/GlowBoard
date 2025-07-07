import SwiftUI
import Domain

public struct ContentView: View {
    private let script = Script(text: "Hello from GlowBoard")
    @State private var settings = ScriptPlaybackSettings()

    public init() {}
    public var body: some View {
        VStack {
            PlaybackTextView(script: script, settings: settings)
                .padding()
            Toggle("Mirror Text", isOn: $settings.isMirrored)
                .padding()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(script: Script(text: "Preview text for GlowBoard scrolling demo."))
    }
}
#endif
