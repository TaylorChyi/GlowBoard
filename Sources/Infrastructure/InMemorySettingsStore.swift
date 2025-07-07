import Foundation
import Domain

/// Simple in-memory implementation of `SettingsRepository`.
public final class InMemorySettingsRepository: SettingsRepository {
    private var settings: UserSettings

    public init(settings: UserSettings = UserSettings()) {
        self.settings = settings
    }

    public func load() -> UserSettings {
        settings
    }

    public func save(_ settings: UserSettings) {
        self.settings = settings
    }
}
