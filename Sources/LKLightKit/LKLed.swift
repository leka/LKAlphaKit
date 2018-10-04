//
//  LKLed.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 06/09/2018.
//

import Foundation
import LKIOKit
import LKAlphaComSpecs

public struct LKLed {

	// TODO: needs to implement command creation + transfer

	//
	// MARK: - Location
	//

	public enum Location {
		case ears
		case belt
	}

	//
	// MARK: - Status
	//

	public enum Status {
		case on
		case off
	}

	//
	// MARK: - Public Variables
	//

	public let io: LKIOServiceProtocol
	public let location: Location
	public let id: UInt8
	public var status: Status
	public var color: LKColor

	//
	// MARK: - Public Methods
	//

	/**

	Initialize individual LED

	### Usage Example:

	```swift
	import LKLibraries
	...

	let myLed = LKLed(location: .belt, id: 3)
	```

	- Parameter location: Where the LED is located, can be `.ear` or `.belt`
	- Parameter id: The id of the LED

	*/
	public init(on location: Location, withId id: UInt8, service io: LKIOServiceProtocol) {
		self.io = io
		self.location = location
		self.id = id
		self.status = .off
		self.color = LKColor(r: 0, g: 0, b: 0)
	}

}

extension LKLed: LKLightProtocol {

	internal func push() {
		if location == .ears {
			io.send(data: [LKCommand.led.ears.single, id, color.red, color.green, color.blue])
		} else {
			io.send(data: [LKCommand.led.belt.single, id, color.red, color.green, color.blue])
		}
	}

	internal func push(data: [UInt8]) {
		if location == .ears {
			io.send(data: [LKCommand.led.ears.single, id] + data)
		} else {
			io.send(data: [LKCommand.led.belt.single, id] + data)
		}
	}

	public mutating func set(r: UInt8, g: UInt8, b: UInt8) {
		self.color = LKColor(r: r, g: g, b: b)
	}

	public mutating func set(h: Int, s: Float, b: Float) {
		self.color = LKColor(h: h, s: s, b: b)
	}

	public mutating func set(_ color: LKColor) {
		self.color = color
	}

	public mutating func set(hex: Int) {
		self.color = LKColor(hex: hex)
	}

	public func isOn() -> Bool {
		return status == .on ? true : false
	}

	public mutating func turnOn() {
		self.status = .on
		push()
	}

	public mutating func turnOff() {
		self.status = .off
		push(data: [LKFactoryColor.black.red, LKFactoryColor.black.green, LKFactoryColor.black.blue])
	}

	@discardableResult
	public mutating func toggle() -> LKLed.Status {
		if status == .on {
			status = .off
			turnOff()
		} else {
			status = .on
			turnOn()
		}
		return status
	}

	public mutating func lightUp(r: UInt8, g: UInt8, b: UInt8) {

	}

	public mutating func lightUp(h: UInt8, s: UInt8, l: UInt8) {

	}

	public mutating func lightUp(_ color: LKColor) {

	}

	public mutating func lightUp(hex: Int) {

	}

	public mutating func update(r: UInt8, g: UInt8, b: UInt8) {

	}

	public mutating func update(h: UInt8, s: UInt8, l: UInt8) {

	}

	public mutating func update(_ color: LKColor) {

	}

	public mutating func update(hex: Int) {

	}

}
