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
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &a)
        return RGBAColor(red: Double(r), green: Double(g), blue: Double(b), alpha: Double(a))
        #else
        return .white
        #endif
    }
}
