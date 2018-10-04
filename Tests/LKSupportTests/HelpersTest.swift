//
//  LKLedTest.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 06/09/2018.
//

import Foundation
import XCTest

@testable import LKSupport

class HelpersTests_string2uint8: XCTestCase {

	func test_array_as_int() {

		let myArray = string2uint8(["12", "34", "0", "255"])
		XCTAssertEqual(myArray, [12, 34, 0, 255])

	}

	func test_array_as_hex() {

		let myArray = string2uint8(["FF", "A3", "3B", "0E"], asHex: true)
		XCTAssertEqual(myArray, [0xFF, 0xA3, 0x3B, 0x0E])

	}

	func test_array_as_hex_with_0x() {

		let myArray = string2uint8(["0xFF", "0xA3", "0x3B", "0x0E"], asHex: true)
		XCTAssertEqual(myArray, [0xFF, 0xA3, 0x3B, 0x0E])

	}

	func test_checksum() {

		XCTAssertEqual(checksum8([0]), 0)
		XCTAssertEqual(checksum8([0, 0, 0, 0]), 0)
		XCTAssertEqual(checksum8([255]), 255)
		XCTAssertEqual(checksum8([255, 0]), 127)
		XCTAssertEqual(checksum8([0x2A, 0x2B, 0x2C, 0x2D]), 0x53)

	}

}
