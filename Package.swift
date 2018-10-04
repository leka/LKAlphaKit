// swift-tools-version:4.2
// Managed by ice

import PackageDescription

let package = Package(
    name: "LKAlphaKit",
    products: [
        .library(name: "LKAlphaKit", targets: ["LKAlphaKit"]),
    ],

	dependencies: [
		.package(url: "https://github.com/leka/LKAlphaComSpecs", from: "3.0.0"),
	]
)

// MARK: - Target - LKAlphaKit

package.targets += [
	.target(name: "LKAlphaKit", dependencies: []),
	.testTarget(name: "LKAlphaKitTests", dependencies: ["LKAlphaKit"]),
]

// MARK: - Target - LKLedKit

package.targets += [
	.target(name: "LKLedKit", dependencies: ["LKAlphaComSpecs"]),
	.testTarget(name: "LKLedKitTests", dependencies: ["LKLedKit"]),
]

// MARK: - Target - _Extensions

package.targets += [
	.target(name: "_Extensions", dependencies: []),
	.testTarget(name: "_ExtensionsTests", dependencies: ["_Extensions"]),
]

// MARK: - Target - _Support

package.targets += [
	.target(name: "_Support", dependencies: []),
	.testTarget(name: "_SupportTests", dependencies: ["_Support"]),
]
