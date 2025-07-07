import SwiftUI
import Domain

public struct ContentView: View {
    @State private var script = Script(text: "GlowBoard Placeholder")
    private let availableFonts = ["System", "Helvetica Neue", "Courier", "Times New Roman"]

    public init() {}

    public var body: some View {
        VStack {
            Text(script.text)
                .font(font(for: script.font.fontName))
                .padding()

            Picker("Font", selection: $script.font.fontName) {
                ForEach(availableFonts, id: \.self) { name in
                    Text(name).tag(name)
                }
            }
            .pickerStyle(.menu)
            .padding()
        }
    }

    private func font(for name: String) -> Font {
        if name == "System" {
            return .system(size: 24)
        } else {
            return .custom(name, size: 24)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
