import Foundation

public struct FontSetting: Codable, Equatable {
    public var fontName: String

    public init(fontName: String) {
        self.fontName = fontName
    }
}
