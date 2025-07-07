// swift-tools-version:5.8
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
