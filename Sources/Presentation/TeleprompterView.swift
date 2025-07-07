import SwiftUI
import Domain

public struct TeleprompterView: View {
    private let script: Script
    private let speed: Double
    @State private var offset: CGFloat = 0
    @State private var textHeight: CGFloat = 0
    @State private var started = false

    public init(script: Script, speed: Double = 30) {
        self.script = script
        self.speed = speed
    }

    public var body: some View {
        GeometryReader { geometry in
            Text(script.text)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .background(
                    GeometryReader { textGeometry in
                        Color.clear.onAppear {
                            guard !started else { return }
                            textHeight = textGeometry.size.height
                            startScrolling(containerHeight: geometry.size.height)
                            started = true
                        }
                    }
                )
                .offset(y: offset)
        }
    }

    private func startScrolling(containerHeight: CGFloat) {
        offset = containerHeight
        let distance = containerHeight + textHeight
        let duration = distance / speed
        withAnimation(.linear(duration: duration)) {
            offset = -textHeight
        }
    }
}
