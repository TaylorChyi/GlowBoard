import SwiftUI

public struct ContentView: View {
    private let provider: LocalizedStringProvider
    public init(provider: LocalizedStringProvider = LocalizationService()) {
        self.provider = provider
    }
    public var body: some View {
        Text(provider.localizedString(forKey: "placeholder_text"))
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
