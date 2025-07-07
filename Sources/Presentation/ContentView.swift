import SwiftUI
import Domain

public struct ContentView: View {
    private let script: Script

    public init(script: Script) {
        self.script = script
    }

    public var body: some View {
        TeleprompterView(script: script)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(script: Script(text: "Preview text for GlowBoard scrolling demo."))
    }
}
#endif
