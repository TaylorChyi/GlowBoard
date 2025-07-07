import Foundation

public struct RGBAColor: Codable, Equatable {
    public var red: Double
    public var green: Double
    public var blue: Double
    public var alpha: Double

    public init(red: Double, green: Double, blue: Double, alpha: Double = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

public struct DisplaySettings: Codable, Equatable {
    public var backgroundColor: RGBAColor

    public init(backgroundColor: RGBAColor = RGBAColor(red: 0, green: 0, blue: 0, alpha: 1)) {
        self.backgroundColor = backgroundColor
    }
}
