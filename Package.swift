// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MELIStoreProducts",
    platforms: [.iOS(.v17), .macOS(.v15), .watchOS(.v7)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MELIStoreProducts",
            targets: ["MELIStoreProducts"]),
    ],
    dependencies: [
        .package(url: "https://github.com/andresduke024/swift-dependency-injector", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/andresduke024/MELIStoreCore", .upToNextMinor(from: "0.0.1")),
        .package(url: "https://github.com/andresduke024/MELIStoreDesignSystem", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MELIStoreProducts",
            dependencies: [
                .product(name: "SwiftDependencyInjector", package: "swift-dependency-injector"),
                .product(name: "MELIStoreCore", package: "MELIStoreCore"),
                .product(name: "MELIStoreDesignSystem", package: "MELIStoreDesignSystem")
            ],
            resources: [
                .process("Presentation/Resources")
            ]
        ),
        .testTarget(
            name: "MELIStoreProductsTests",
            dependencies: [
                "MELIStoreProducts",
                .product(name: "SwiftDependencyInjector", package: "swift-dependency-injector"),
                .product(name: "MELIStoreCore", package: "MELIStoreCore")
            ]
        ),
    ]
)
