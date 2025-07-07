import Foundation

/// Stores user configurable settings.
public struct UserSettings: Codable, Equatable {
    public var textColor: RGBAColor
    public var fontSize: Double

    public init(textColor: RGBAColor = .white, fontSize: Double = 24) {
        self.textColor = textColor
        self.fontSize = fontSize
    }
}
