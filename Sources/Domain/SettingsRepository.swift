import Foundation

/// Provides persistence for user settings.
public protocol SettingsRepository {
    func load() -> UserSettings
    func save(_ settings: UserSettings)
public protocol SettingsRepository {
    func fetchSettings() -> DisplaySettings
    func save(settings: DisplaySettings)
}
