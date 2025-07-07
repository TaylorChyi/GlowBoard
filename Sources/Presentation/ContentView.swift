import SwiftUI

public struct ContentView: View {
    public init() {}
    public var body: some View {
        Text("GlowBoard Placeholder")
            .padding()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
