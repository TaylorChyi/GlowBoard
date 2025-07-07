import Foundation

public struct DisplaySettings: Codable, Equatable {
    public var backgroundColor: RGBAColor

    public init(backgroundColor: RGBAColor = RGBAColor(red: 0, green: 0, blue: 0, alpha: 1)) {
        self.backgroundColor = backgroundColor
    }
}
