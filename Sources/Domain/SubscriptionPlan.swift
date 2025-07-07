import Foundation

/// Represents a purchasable subscription option.
public struct SubscriptionPlan: Equatable {
    public let id: String
    public let title: String
    public let price: Decimal
    public let duration: TimeInterval

    public init(id: String, title: String, price: Decimal, duration: TimeInterval) {
        self.id = id
        self.title = title
        self.price = price
        self.duration = duration
    }
}
