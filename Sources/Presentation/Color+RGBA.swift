import SwiftUI
import Domain
import UIKit

public extension Color {
    init(rgbaColor: RGBAColor) {
        self.init(
            .sRGB,
            red: rgbaColor.red,
            green: rgbaColor.green,
            blue: rgbaColor.blue,
            opacity: rgbaColor.alpha
        )
    }

    func toRGBAColor() -> RGBAColor {
        #if canImport(UIKit)

extension Color {
    init(_ color: RGBAColor) {
        self.init(red: color.red, green: color.green, blue: color.blue, opacity: color.alpha)
    }
}

extension RGBAColor {
    init(_ color: Color) {
        #if canImport(UIKit)
        let uiColor = UIColor(color)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &a)
        return RGBAColor(red: Double(r), green: Double(g), blue: Double(b), alpha: Double(a))
        #else
        return .white
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.init(red: Double(r), green: Double(g), blue: Double(b), alpha: Double(a))
        #else
        self.init(red: 0, green: 0, blue: 0, alpha: 1)
        #endif
    }
}
