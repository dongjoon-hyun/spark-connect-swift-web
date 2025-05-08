// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "SparkConnectSwiftWebapp",
    platforms: [
       .macOS(.v15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.110.1"),
        // 🔵 Non-blocking, event-driven networking for Swift. Used for custom executors
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.65.0"),
        .package(url: "https://github.com/apache/spark-connect-swift.git", branch: "v0.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "SparkConnectSwiftWebapp",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio"),
                .product(name: "SparkConnect", package: "spark-connect-swift"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "SparkConnectSwiftWebappTests",
            dependencies: [
                .target(name: "SparkConnectSwiftWebapp"),
                .product(name: "VaporTesting", package: "vapor"),
            ],
            swiftSettings: swiftSettings
        )
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("ExistentialAny"),
] }
