import Foundation

/// Provides persistence for user display settings.
public protocol DisplaySettingsRepository {
    func fetchSettings() -> DisplaySettings
    func save(settings: DisplaySettings)
}

/// Provides persistence for general user settings.
public protocol SettingsRepository {
    func load() -> UserSettings
    func save(_ settings: UserSettings)
}
