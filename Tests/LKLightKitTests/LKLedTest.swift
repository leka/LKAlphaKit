//
//  LKLedTest.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 06/09/2018.
//

import Foundation
import XCTest

import LKIOKit

@testable import LKLightKit

class LKLedTests_init: XCTestCase {

	func test_init_set_location() {

		let io = LKIOServiceCLI()
		let myLed = LKLed(on: .belt, withId: 6, service: io)

		XCTAssertEqual(myLed.location, .belt)

	}

	func test_init_set_id() {

		let io = LKIOServiceCLI()
		let myLed = LKLed(on: .belt, withId: 6, service: io)

		XCTAssertEqual(myLed.id, 6)

	}

	func test_init_set_status() {

		let io = LKIOServiceCLI()
		let myLed = LKLed(on: .belt, withId: 6, service: io)

		XCTAssertEqual(myLed.status, .off)

	}

	func test_init_set_color() {

		let io = LKIOServiceCLI()
		let myLed = LKLed(on: .belt, withId: 6, service: io)

		XCTAssertEqual(myLed.color.red, 0)
		XCTAssertEqual(myLed.color.green, 0)
		XCTAssertEqual(myLed.color.blue, 0)

	}

}

class LKLedTests_set: XCTestCase {

	let r: UInt8 = 50
	let g: UInt8 = 150
	let b: UInt8 = 255

	func test_set_rgb() {

		let io = LKIOServiceCLI()
		var myLed = LKLed(on: .belt, withId: 6, service: io)

		myLed.set(r: r, g: g, b: b)

		XCTAssertEqual(myLed.color.red, r)
		XCTAssertEqual(myLed.color.green, g)
		XCTAssertEqual(myLed.color.blue, b)

	}

	func test_set_hex() {

		let io = LKIOServiceCLI()
		var myLed = LKLed(on: .belt, withId: 6, service: io)

		myLed.set(hex: rgb2hex(r, g, b))

		XCTAssertEqual(myLed.color.red, r)
		XCTAssertEqual(myLed.color.green, g)
		XCTAssertEqual(myLed.color.blue, b)

	}

	func test_set_lkcolor() {

		let io = LKIOServiceCLI()
		var myLed = LKLed(on: .belt, withId: 6, service: io)

		myLed.set(LKFactoryColor.red)

		XCTAssertEqual(myLed.color.red, LKFactoryColor.red.red)
		XCTAssertEqual(myLed.color.green, LKFactoryColor.red.green)
		XCTAssertEqual(myLed.color.blue, LKFactoryColor.red.blue)

	}

}

class LKLedTests_turnOn_turnOff_toggle: XCTestCase {

	func test_turnOn() {

		let io = LKIOServiceCLI()
		var myLed = LKLed(on: .belt, withId: 6, service: io)

		myLed.turnOn()
		XCTAssertEqual(myLed.status, .on)

	}

	func test_turnOff() {

		let io = LKIOServiceCLI()
		var myLed = LKLed(on: .belt, withId: 6, service: io)

		myLed.turnOn()
		XCTAssertEqual(myLed.status, .on)
		myLed.turnOff()
		XCTAssertEqual(myLed.status, .off)

	}

	func test_toggle() {

		let io = LKIOServiceCLI()
		var myLed = LKLed(on: .belt, withId: 6, service: io)

		myLed.toggle()
		XCTAssertEqual(myLed.status, .on)
		myLed.toggle()
		XCTAssertEqual(myLed.status, .off)
		myLed.toggle()
		XCTAssertEqual(myLed.status, .on)
		myLed.toggle()
		XCTAssertEqual(myLed.status, .off)

	}

}

class LKLedTests_isOn: XCTestCase {

	func test_isOn_false_with_off() {

		let io = LKIOServiceCLI()
		let myLed = LKLed(on: .belt, withId: 6, service: io)

		XCTAssertFalse(myLed.isOn())

	}

	func test_isOn_true_with_on() {

		let io = LKIOServiceCLI()
		var myLed = LKLed(on: .belt, withId: 6, service: io)

		myLed.turnOn()
		XCTAssertTrue(myLed.isOn())

	}

	func test_isOn_false_with_on_then_off() {

		let io = LKIOServiceCLI()
		var myLed = LKLed(on: .belt, withId: 6, service: io)

		myLed.turnOn()
		XCTAssertTrue(myLed.isOn())
		myLed.turnOff()
		XCTAssertFalse(myLed.isOn())

	}

}
