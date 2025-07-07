import Foundation
import Domain
#if canImport(StoreKit)
import StoreKit
#endif

/// StoreKit-based implementation of PurchaseService.
public final class StoreKitPurchaseService: PurchaseService {
    private let plans: [SubscriptionPlan]

    public init(plans: [SubscriptionPlan]) {
        self.plans = plans
    }

    public func availablePlans() -> [SubscriptionPlan] {
        plans
    }

    public func purchase(plan: SubscriptionPlan) async throws {
        // TODO: integrate with StoreKit purchase API
    }

    public func restorePurchases() async throws {
        // TODO: integrate with StoreKit restore API
    }
}
