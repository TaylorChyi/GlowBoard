import Foundation
import Domain

public final class InMemoryUserSettingsRepository: UserSettingsRepository {
    private var stored: UserSettings

    public init(initial: UserSettings = UserSettings()) {
        self.stored = initial
    }

    public func loadSettings() -> UserSettings {
        stored
    }

    public func save(settings: UserSettings) {
        stored = settings
    }
}
