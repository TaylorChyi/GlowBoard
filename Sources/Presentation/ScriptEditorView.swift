#if canImport(SwiftUI)
import SwiftUI

public struct ScriptEditorView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var text: String = ""
    private let onSave: (String) -> Void

    public init(onSave: @escaping (String) -> Void) {
        self.onSave = onSave
    }

    public var body: some View {
        NavigationView {
            TextEditor(text: $text)
                .padding()
                .navigationTitle("New Script")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            onSave(text)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        }
    }
}
#else
public struct ScriptEditorView {
    public init(onSave: @escaping (String) -> Void) {}
}
#endif
