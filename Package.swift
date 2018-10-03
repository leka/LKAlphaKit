// swift-tools-version:4.2
// Managed by ice

import PackageDescription

let package = Package(
    name: "LKAlphaKit",
    products: [
        .library(name: "LKAlphaKit", targets: ["LKAlphaKit"]),
    ],
    targets: [
        .target(name: "LKAlphaKit", dependencies: []),
        .testTarget(name: "LKAlphaKitTests", dependencies: ["LKAlphaKit"]),
    ]
)
