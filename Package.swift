// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Isometrik_Video_Reels",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Isometrik_Video_Reels",
            targets: ["Isometrik_Video_Reels"]),
    ],
    dependencies: [
            // Add the package dependency here
        .package(url: "https://github.com/Instagram/IGListKit.git", .upToNextMajor(from: "5.0.0"))
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Isometrik_Video_Reels",
            dependencies: [
                "IGListKit"
            ]
        )
    ]
)
