import Foundation

public protocol SettingsRepository {
    func fetchSettings() -> DisplaySettings
    func save(settings: DisplaySettings)
}
