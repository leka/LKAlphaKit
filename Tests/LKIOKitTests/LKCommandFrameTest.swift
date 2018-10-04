//
//  LKLedTest.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 06/09/2018.
//

import Foundation
import XCTest

import LKAlphaComSpecs

@testable import LKIOKit

class LKCommandFrameTests_init: XCTestCase {

	let data: [UInt8] = [0x15, 0x00, 0x00, 0x00, 0xFF, 0x15, 0x01, 0x00, 0xFF, 0x00, 0x15, 0x02, 0xFF, 0x00, 0x00, 0x15, 0x03, 0xFF, 0xFF, 0xFF]
	let dataLength: UInt8 = 0x14
	let length: UInt8 = 0x1A
	let checksum: UInt8 = 0x7E
	let frame: [UInt8] = [0x2A, 0x2B, 0x2C, 0x2D, 0x14, 0x15, 0x00, 0x00, 0x00, 0xFF, 0x15, 0x01, 0x00, 0xFF, 0x00, 0x15, 0x02, 0xFF, 0x00, 0x00, 0x15, 0x03, 0xFF, 0xFF, 0xFF, 0x7E]
	let emptyFrame: [UInt8] = [0x2A, 0x2B, 0x2C, 0x2D, 0x00, 0x00]
	let readable = "2A 2B 2C 2D   14   15 00 00 00 FF 15 01 00 FF 00 15 02 FF 00 00 15 03 FF FF FF   7E"
	let info = """
	data     --> [0x15, 0x00, 0x00, 0x00, 0xFF, 0x15, 0x01, 0x00, 0xFF, 0x00, 0x15, 0x02, 0xFF, 0x00, 0x00, 0x15, 0x03, 0xFF, 0xFF, 0xFF] / [21, 0, 0, 0, 255, 21, 1, 0, 255, 0, 21, 2, 255, 0, 0, 21, 3, 255, 255, 255]
	length   --> 0x14 / 20
	checksum --> 0x7E / 126
	frame    --> 2A 2B 2C 2D   14   15 00 00 00 FF 15 01 00 FF 00 15 02 FF 00 00 15 03 FF FF FF   7E
	length   --> 26
	array    --> [0x2A, 0x2B, 0x2C, 0x2D, 0x14, 0x15, 0x00, 0x00, 0x00, 0xFF, 0x15, 0x01, 0x00, 0xFF, 0x00, 0x15, 0x02, 0xFF, 0x00, 0x00, 0x15, 0x03, 0xFF, 0xFF, 0xFF, 0x7E]

	"""

	lazy var myFrame = LKCommandFrame(data: data)

	func test_init_startByte() {

		XCTAssertEqual(myFrame.startSequence, LKFrame.start.sequence)

	}

	func test_init_command() {

		XCTAssertEqual(myFrame.data, data)

	}

	func test_init_dataLength() {

		XCTAssertEqual(myFrame.dataLength, dataLength)

	}

	func test_init_length() {

		XCTAssertEqual(myFrame.length, length)

	}

	func test_init_checksum() {

		XCTAssertEqual(myFrame.checksum, checksum)

	}

	func test_init_fullFrame() {

		XCTAssertEqual(myFrame.fullFrame, frame)

	}

	func test_init_asReadableString() {

		XCTAssertEqual(myFrame.asReadableHexString, readable)

	}

	func test_init_info() {

		XCTAssertEqual(myFrame.info, info)

	}

	func test_clear() {

		XCTAssertEqual(myFrame.data, data)

		myFrame.clear()

		XCTAssertEqual(myFrame.data, [])
		XCTAssertEqual(myFrame.fullFrame, emptyFrame)

	}

}
