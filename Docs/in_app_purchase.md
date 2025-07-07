# 应用内购买架构设计

为了在 GlowBoard 中实现一个高内聚、低耦合的订阅功能，建议按现有分层模式新增「购买」模块。该模块提供一月自动续订和一年 99 元的付费方案，并通过协议解耦业务逻辑与 StoreKit 实现。

## 分层关系
- **Domain**：定义 `SubscriptionPlan` 数据结构与 `PurchaseService` 协议，声明购买与恢复接口。
- **Infrastructure**：实现 `PurchaseService`，具体使用 StoreKit2 与苹果后台交互。
- **Presentation**：通过依赖 `PurchaseService` 展示可选方案并触发购买，不直接依赖 StoreKit。

这种划分使界面层无需了解底层实现，方便后续替换或单元测试。

## 订阅方案示例
1. `monthly`：1 个月自动续订。
2. `annual`：1 年价格 99 元，可按年订阅。

`PurchaseService` 返回以上计划供界面展示，实际售价与产品标识在 App Store Connect 配置，由 StoreKit 查询。

## 实现要点
- 使用 `async/await` 处理购买与恢复流程，保持界面响应。
- 在 Infrastructure 层封装对 `Product.purchase()` 和 `Transaction.currentEntitlements` 的调用。
- 通过依赖注入将 `PurchaseService` 实例传递给需要的视图或 ViewModel，保持模块间低耦合。

通过以上架构，GlowBoard 可以在保持代码整洁的同时，为用户提供稳定的订阅功能。
