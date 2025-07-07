import Foundation

/// Provides persistence for user settings.
public protocol SettingsRepository {
    func load() -> UserSettings
    func save(_ settings: UserSettings)
}
