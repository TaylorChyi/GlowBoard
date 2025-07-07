# AGENTS for GlowBoard

本项目是一个面向演讲者、主播和教师的 iOS 提词器应用，旨在提供极简且专注的文字滚动体验。请遵循以下约定进行开发和维护：

## 代码风格
- 主要使用 **Swift 5** 编写，遵循 Apple 的 [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)。
- 类型名使用 `PascalCase`，变量和函数名使用 `camelCase`。
- 所有用户界面应保持简洁、自然，避免过度装饰，符合 README 中描述的设计理念。
- 代码、注释及文件和路径命名均使用英文，仅 PR 描述和 Markdown 文档可使用中文。

## 目录约定
- 当创建源代码时，请在 `Sources/` 目录下放置主工程文件。
- 测试代码应位于 `Tests/` 目录。
- 项目文档放在根目录或 `Docs/` 下。

## 测试
- 若项目包含 Xcode 工程，运行 `xcodebuild test -scheme GlowBoard -destination 'platform=iOS Simulator,OS=latest,name=iPhone 14'` 执行测试。
- 提交代码前尽量确保测试通过，无法运行时在 PR 中说明原因。

## Pull Request 说明
- 合并前请确保 `git status` 干净。
- PR 描述使用 **中文** 简要说明变更内容。
- 在回答中提供引用代码行及测试结果，若受限于环境请在“Testing”部分包含提示。

遵守以上规范有助于保持代码整洁并实现易于维护的 GlowBoard 应用。
