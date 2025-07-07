// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "GlowBoard",
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
            path: "Sources/Presentation"
        ),
        .executableTarget(
            name: "App",
            dependencies: ["Presentation", "Infrastructure", "Domain"],
            path: "Sources/App"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain", "Infrastructure"],
            path: "Tests/DomainTests"
        ),
        .testTarget(
            name: "InfrastructureTests",
            dependencies: ["Infrastructure"],
            dependencies: ["Infrastructure", "Domain"],
            path: "Tests/InfrastructureTests"
        )
    ]
)
