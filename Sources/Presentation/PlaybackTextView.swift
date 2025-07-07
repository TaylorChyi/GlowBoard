import Domain
#if canImport(SwiftUI)
import SwiftUI

/// Displays script text with optional mirroring for teleprompter usage.
public struct PlaybackTextView: View {
    private let script: Script
    private let settings: ScriptPlaybackSettings

    public init(script: Script, settings: ScriptPlaybackSettings = .init()) {
        self.script = script
        self.settings = settings
    }

    public var body: some View {
        Text(script.text)
            .scaleEffect(x: settings.isMirrored ? -1 : 1, y: 1)
    }
}
#endif
