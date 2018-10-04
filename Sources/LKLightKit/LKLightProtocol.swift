//
//  LKLightProtocol.swift
//  LKAlphaKit
//
//  Created by Ladislas de Toldi on 04/10/2018.
//

import Foundation

protocol LKLightProtocol {

	//
	// MARK: - send
	//

	func push()
	func push(data: [UInt8])

	//
	// MARK: - set
	//

	/**

	Set the RGB color of the LED

	## Usage Example:

	```swift
	myLed.set(r: 255, g: 0, b: 0)
	```

	- Parameter r: Red value, between 0..255
	- Parameter g: Green value, between 0..255
	- Parameter b: Blue value, between 0..255

	*/
	mutating func set(r: UInt8, g: UInt8, b: UInt8)

	/**

	Set the HSL color of the LED

	## Usage Example:

	```swift
	myLed.set(h:255, s: 0, l: 0)
	```

	- Parameter h: the angle in degrees (°)
	- Parameter s: the saturation value between 0.0..1.0
	- Parameter b: the brightness value between 0.0..1.0

	*/
	mutating func set(h: Int, s: Float, b: Float)

	/**

	Set the LKColor color of the LED

	## Usage Example:

	```swift
	myLed.set(LKColor.red)
	```

	- Parameter lkcolor: `LKColor` to be set

	*/
	mutating func set(_ color: LKColor)

	/**

	Set the HEX color of the LED

	## Usage Example:

	```swift
	myLed.set(0xAE78FF)
	```

	- Parameter hex: hexadecimal Int representing the color


	*/
	mutating func set(hex: Int)

	//
	// MARK: - status
	//

	/**

	Get on/off status

	## Usage Example:

	```swift
	if myLed.isOn() {
	...
	}
	```

	- Returns: `true` if `status == .on` and `false` otherwise

	*/
	func isOn() -> Bool

	//
	// MARK: - turn on/off
	//

	/**

	Turn on LED

	*Note*: LED must be set to a color before

	## Usage Example:

	```swift
	myLed.set(255, 0, 0)
	myLed.turnOn()
	```

	*/
	mutating func turnOn()

	/**

	Turn off LED.

	*Note*: It doesn't change the color of the LED

	## Usage Example:

	```swift
	myLed.set(255, 0, 0)
	myLed.turnOn()
	...
	myLed.turnOff()
	```

	*/
	mutating func turnOff()

	/**

	Toggle LED on and off.

	*Note*: It doesn't change the color of the LED

	## Usage Example:

	```swift
	myLed.set(255, 0, 0)
	myLed.turnOn()
	...
	myLed.toggle()
	```

	*/
	@discardableResult
	mutating func toggle() -> LKLed.Status

	//
	// MARK: - light up
	//

	mutating func lightUp(r: UInt8, g: UInt8, b: UInt8)
	mutating func lightUp(h: UInt8, s: UInt8, l: UInt8)
	mutating func lightUp(_ color: LKColor)
	mutating func lightUp(hex: Int)

	//
	// MARK: - update
	//

	mutating func update(r: UInt8, g: UInt8, b: UInt8)
	mutating func update(h: UInt8, s: UInt8, l: UInt8)
	mutating func update(_ color: LKColor)
	mutating func update(hex: Int)

}
