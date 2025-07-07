# 系统设计与技术选型

本节提供 GlowBoard 的总体架构和技术选择。

## 架构概览

- **客户端**：iOS 应用，使用 Swift 5 编写，界面遵循 Apple Human Interface Guidelines。
- **数据层**：本地使用 Core Data 保存稿件和设置；通过 CloudKit 实现多设备同步。
- **远程控制**：使用 Multipeer Connectivity 建立局域网连接，支持 iPhone 与 iPad 间的控制交互。
- **语音控制**：依赖 Speech 框架和 SiriKit，识别简单指令触发播放/暂停。
- **文件导入导出**：借助 UIDocumentPicker 访问本地文件，使用标准分享面板导出。

## 技术选型

| 功能 | 技术 | 理由 |
| --- | --- | --- |
| UI 构建 | SwiftUI | 声明式语法，代码量少 |
| 本地数据持久化 | Core Data | 与 CloudKit 集成方便 |
| 云端同步 | CloudKit | 原生支持 iCloud |
| 语音识别 | Speech Framework | 本地识别，隐私友好 |
| 远程控制通信 | Multipeer Connectivity | 局域网传输，延迟低 |

此架构确保核心功能可离线运行，在有网络时完成数据同步与远程控制。Future 版本可根据需求扩展更多平台支持。
