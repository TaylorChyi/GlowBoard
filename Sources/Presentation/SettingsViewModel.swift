import SwiftUI
import Domain

public final class SettingsViewModel: ObservableObject {
    private let repository: SettingsRepository
    @Published public var backgroundColor: Color

    public init(repository: SettingsRepository) {
        self.repository = repository
        let settings = repository.fetchSettings()
        self.backgroundColor = Color(settings.backgroundColor)
    }

    public func updateBackgroundColor(_ color: Color) {
        backgroundColor = color
        repository.save(settings: DisplaySettings(backgroundColor: RGBAColor(color)))
    }
}
