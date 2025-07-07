import Foundation

public struct Script {
    public var text: String
    public var font: FontSetting

    public init(text: String, font: FontSetting = FontSetting(fontName: "System")) {
        self.text = text
        self.font = font
    }

    /// Returns the number of words in the script text.
    public func wordCount() -> Int {
        text.split { $0.isWhitespace || $0.isNewline }.count
    }
}
