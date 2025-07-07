import Foundation
import Domain
#if canImport(SwiftUI)
import SwiftUI

public final class SettingsViewModel: ObservableObject {
    @Published public private(set) var settings: UserSettings
    private let repository: SettingsRepository

    public init(repository: SettingsRepository) {
        self.repository = repository
        self.settings = repository.load()
    }

    public func updateTextColor(_ color: RGBAColor) {
        settings.textColor = color
        repository.save(settings)
    }

    public func updateFontSize(_ size: Double) {
        settings.fontSize = size
        repository.save(settings)
    }
}
#endif
