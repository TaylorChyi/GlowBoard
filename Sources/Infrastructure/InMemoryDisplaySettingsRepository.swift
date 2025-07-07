import Foundation
import Domain

public final class InMemoryDisplaySettingsRepository: DisplaySettingsRepository {
    private var currentSettings: DisplaySettings

    public init(settings: DisplaySettings = DisplaySettings()) {
        self.currentSettings = settings
    }

    public func fetchSettings() -> DisplaySettings {
        currentSettings
    }

    public func save(settings: DisplaySettings) {
        currentSettings = settings
    }
}
