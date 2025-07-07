// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "GlowBoard",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .executable(name: "GlowBoard", targets: ["App"])
    ],
    targets: [
        .target(
            name: "Domain",
            path: "Sources/Domain"
        ),
        .target(
            name: "Infrastructure",
            dependencies: ["Domain"],
            path: "Sources/Infrastructure"
        ),
        .target(
            name: "Presentation",
            dependencies: ["Domain"],
            path: "Sources/Presentation",
            resources: [
                .process("Resources")
            ]
        ),
        .executableTarget(
            name: "App",
            dependencies: ["Presentation", "Infrastructure", "Domain"],
            path: "Sources/App"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"],
            path: "Tests/DomainTests"
        )
    ]
)
