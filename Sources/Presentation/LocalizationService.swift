import Foundation

public protocol LocalizedStringProvider {
    func localizedString(forKey key: String) -> String
}

public struct LocalizationService: LocalizedStringProvider {
    public init() {}

    public func localizedString(forKey key: String) -> String {
        NSLocalizedString(key, bundle: .module, comment: "")
    }
}
