// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GlowBoard",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .executable(name: "GlowBoard", targets: ["GlowBoard"])
    ],
    targets: [
        .executableTarget(
            name: "GlowBoard",
            path: "Sources/GlowBoard"
        ),
        .testTarget(
            name: "GlowBoardTests",
            dependencies: ["GlowBoard"],
            path: "Tests/GlowBoardTests"
        )
    ]
)
