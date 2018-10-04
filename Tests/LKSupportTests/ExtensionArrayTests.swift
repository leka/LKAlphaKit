//
//  LKLedTest.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 06/09/2018.
//

import Foundation
import XCTest

@testable import LKSupport

class ExtensionArrayTest: XCTestCase {

	let myArray: [UInt8] = [0x15, 0x00, 0x00, 0x00, 0xFF, 0x15, 0x01, 0x00, 0xFF, 0x00, 0x15, 0x02, 0xFF, 0x00, 0x00, 0x15, 0x03, 0xFF, 0xFF, 0xFF]

	let hexString = "15 00 00 00 FF 15 01 00 FF 00 15 02 FF 00 00 15 03 FF FF FF"
	let hexArray = "[0x15, 0x00, 0x00, 0x00, 0xFF, 0x15, 0x01, 0x00, 0xFF, 0x00, 0x15, 0x02, 0xFF, 0x00, 0x00, 0x15, 0x03, 0xFF, 0xFF, 0xFF]"
	let intString = "21 0 0 0 255 21 1 0 255 0 21 2 255 0 0 21 3 255 255 255"
	let intArray = "[21, 0, 0, 0, 255, 21, 1, 0, 255, 0, 21, 2, 255, 0, 0, 21, 3, 255, 255, 255]"


	func test_asHexString() {

		XCTAssertEqual(myArray.asHexString, hexString)

	}

	func test_asHexArray() {

		XCTAssertEqual(myArray.asHexArray, hexArray)

	}

	func test_asUInt8String() {

		XCTAssertEqual(myArray.asUInt8String, intString)

	}

	func test_asUInt8Array() {

		XCTAssertEqual(myArray.asUInt8Array, intArray)

	}
}
