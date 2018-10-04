// swift-tools-version:4.2
// Managed by ice

import PackageDescription

let package = Package(
    name: "LKAlphaKit",
    products: [
        .library(name: "LKAlphaKit", targets: ["LKAlphaKit"]),
		.library(name: "LKLedKit", targets: ["LKLedKit"]),
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

// MARK: - Target - LKIOKit

package.targets += [
	.target(name: "LKIOKit", dependencies: ["LKAlphaComSpecs", "LKSupport"]),
	.testTarget(name: "LKIOKitTests", dependencies: ["LKIOKit"]),
]

// MARK: - Target - LKLedKit

package.targets += [
	.target(name: "LKLedKit", dependencies: ["LKAlphaComSpecs", "LKIOKit"]),
	.testTarget(name: "LKLedKitTests", dependencies: ["LKLedKit"]),
]

// MARK: - Target - LKSupport

package.targets += [
	.target(name: "LKSupport", dependencies: []),
	.testTarget(name: "LKSupportTests", dependencies: ["LKSupport"]),
]

// MARK: - Swift Version

package.swiftLanguageVersions = [.v4, .v4_2]
