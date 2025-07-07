import Foundation

/// Stores user configurable settings.
public struct UserSettings: Codable, Equatable {
    public var textColor: RGBAColor

    public init(textColor: RGBAColor = .white) {
        self.textColor = textColor
public struct UserSettings {
    public var fontSize: Double

    public init(fontSize: Double = 24) {
        self.fontSize = fontSize
    }
}
