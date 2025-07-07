import Foundation

public struct Script {
    public var text: String

    public init(text: String) {
        self.text = text
    }

    /// Returns the number of words in the script text.
    public func wordCount() -> Int {
        text.split { $0.isWhitespace || $0.isNewline }.count
    }
}
