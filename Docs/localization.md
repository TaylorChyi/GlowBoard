# 多语言支持设计

为保证应用在全球范围内易于使用，GlowBoard 采用系統自带的本地化机制实现多语言版本。通过在 `Presentation` 模块中引入 `LocalizationService`，界面文案与语言资源解耦，保持模块高内聚、低耦合。

## 方案要点

1. **资源文件隔离**：在 `Sources/Presentation/Resources` 下分别创建 `en.lproj`、`zh-Hans.lproj` 等目录存放 `Localizable.strings`，未来可按需扩展更多语言。
2. **统一的字符串提供者**：定义 `LocalizedStringProvider` 协议及其默认实现 `LocalizationService`，外部通过依赖注入使用，避免直接依赖 `NSLocalizedString`。
3. **界面调用示例**：`ContentView` 等视图从提供者获取文案，不关心具体语言设置。切换系统语言后重新启动应用即可看到对应的界面文本。

此设计遵循分层架构原则，使得多语言扩展不影响业务逻辑和数据层，实现可维护的国际化方案。
