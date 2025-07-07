# 镜像播放功能设计

为保持高内聚、低耦合，镜像播放作为业务层 `ScriptPlaybackSettings` 的一个属性实现。
展示层 `PlaybackTextView` 只依赖该设置显示文本，无需了解业务逻辑细节。

```
Domain
└── ScriptPlaybackSettings.isMirrored
Presentation
└── PlaybackTextView 读取设置并通过 `scaleEffect` 镜像文本
```

如此可在不修改数据层的情况下拓展 UI 表现，同时便于单元测试。
