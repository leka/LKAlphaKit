//
//  LKCommand.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 08/09/2018.
//

import Foundation
import LKAlphaComSpecs
import LKSupport

public struct LKCommandFrame {

	public let startSequence: [UInt8] = LKFrame.start.sequence
	public var data: [UInt8]

	public var dataLength: UInt8 {
		return UInt8(data.count)
	}

	public var length: UInt8 {
		return UInt8(fullFrame.count)
	}

	public var checksum: UInt8 {
		return checksum8(data)
	}

	public var fullFrame: [UInt8] {

		var array: [UInt8] = []

		array.append(contentsOf: startSequence)
		array.append(dataLength)
		array.append(contentsOf: data)
		array.append(checksum)

		return array

	}

	public init(data: [UInt8]) {
		self.data = data
	}

	/**
	Output frame as readable hex string

	### Usage Example:

	```swift
	let myFrame = LKCommandFrame(data: [0, 23, 34, 88])
	print(myFrame.asReadableHexString)
	```

	- Returns: String with hex values
	*/
	public var asReadableHexString: String {
		return "\(startSequence.asHexString)   \(String(format: "%02X", dataLength))   \(data.asHexString)   \(String(format: "%02X", checksum))"
	}

	/**
	Output nice info about a frame

	### Usage Example:

	```swift
	let myFrame = LKCommandFrame(data: [0, 23, 34, 88])
	print(myFrame.info)
	```

	- Returns: Information as multiline String
	*/
	public var info: String {
		return """
		data     --> \(data.asHexArray) / \(data.asUInt8Array)
		length   --> \(String(format: "0x%02X", dataLength)) / \(String(dataLength))
		checksum --> \(String(format: "0x%02X", checksum)) / \(String(checksum))
		frame    --> \(asReadableHexString)
		length   --> \(length)
		array    --> \(fullFrame.asHexArray)

		"""
	}

	/**
	Clear frame's data

	### Usage Example:

	```swift
	let myFrame = LKCommandFrame(data: [0, 23, 34, 88])
	myFrame.clear()
	```
	*/
	public mutating func clear() {
		data = []
	}

}

extension LKCommandFrame: Equatable {}
