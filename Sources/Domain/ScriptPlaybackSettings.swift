import Foundation

/// Settings controlling script playback appearance.
public struct ScriptPlaybackSettings {
    /// Displays text mirrored horizontally when true.
    public var isMirrored: Bool

    public init(isMirrored: Bool = false) {
        self.isMirrored = isMirrored
    }
}
