import Foundation

public struct Script: Identifiable, Codable {
    public let id: UUID
    public var text: String
    public var font: FontSetting

    public init(id: UUID = UUID(), text: String, font: FontSetting = FontSetting(fontName: "System")) {
        self.id = id
        self.text = text
        self.font = font
    }

    /// Returns the number of words in the script text.
    public func wordCount() -> Int {
        text.split { $0.isWhitespace || $0.isNewline }.count
    }
}
