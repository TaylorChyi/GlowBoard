import Foundation

/// Protocol describing basic purchase interactions.
public protocol PurchaseService {
    /// Returns available subscription plans.
    func availablePlans() -> [SubscriptionPlan]

    /// Initiates purchase of a plan.
    func purchase(plan: SubscriptionPlan) async throws

    /// Restores previous transactions.
    func restorePurchases() async throws
}
