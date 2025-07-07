import Foundation

public protocol UserSettingsRepository {
    func loadSettings() -> UserSettings
    func save(settings: UserSettings)
}
