// swift-tools-version:4.2
// Managed by ice

import PackageDescription

let package = Package(
    name: "LKAlphaKit",
    products: [
        .library(name: "LKAlphaKit", targets: ["LKAlphaKit"]),
    ]
)

// MARK: - Target - LKAlphaKit

package.targets += [
	.target(name: "LKAlphaKit", dependencies: []),
	.testTarget(name: "LKAlphaKitTests", dependencies: ["LKAlphaKit"]),
]

// MARK: - Target - _Extensions

package.targets += [
	.target(name: "_Extensions", dependencies: []),
	.testTarget(name: "_ExtensionsTest", dependencies: ["_Extensions"]),
]
