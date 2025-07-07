import Foundation
import Domain

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
}
