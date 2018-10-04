//
//  LKLedTest.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 06/09/2018.
//

import Foundation
import XCTest

@testable import LKLightKit

class LKColorsTests_init: XCTestCase {

	let red: UInt8 = 100
	let green: UInt8 = 0
	let blue: UInt8 = 255

	lazy var color = LKColor(red, green, blue)

	func test_init() {

		XCTAssertEqual(color.red, red)
		XCTAssertEqual(color.green, green)
		XCTAssertEqual(color.blue, blue)

	}

}

class LKColorsTests_set: XCTestCase {

	func test_set() {

		var red: UInt8 = 100
		var green: UInt8 = 0
		var blue: UInt8 = 255

		var color = LKColor(red, green, blue)

		XCTAssertEqual(color.red, red)
		XCTAssertEqual(color.green, green)
		XCTAssertEqual(color.blue, blue)

		red = 34
		green = 78
		blue = 250

		color.set(red, green, blue)

		XCTAssertEqual(color.red, red)
		XCTAssertEqual(color.green, green)
		XCTAssertEqual(color.blue, blue)

	}

}

class LKColorsTests_equality: XCTestCase {

	let color1 = LKFactoryColor.red
	let color2 = LKFactoryColor.blue
	let color3 = LKFactoryColor.red

	func test_equal() {

		XCTAssertEqual(color1, color3)
		XCTAssertEqual(color3, color1)

	}

	func test_not_equal() {
		XCTAssertNotEqual(color1, color2)
		XCTAssertNotEqual(color2, color1)
	}

}
