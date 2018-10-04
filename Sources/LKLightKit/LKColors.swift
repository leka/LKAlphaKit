//
//  LKColors.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 08/09/2018.
//

import Foundation

//
// MARK: - LKColors
//

public struct LKColor: Equatable {

	public var red: UInt8, green: UInt8, blue: UInt8

	public init(r: UInt8, g: UInt8, b: UInt8) {
		self.red = r
		self.green = g
		self.blue = b
	}

	public init(_ r: UInt8, _ g: UInt8, _ b: UInt8) {
		self.init(r: r, g: g, b: b)
	}

	public init(h: Int, s: Float, b: Float) {
		self = hsb2rgb(h: h, s: s, b: b)
	}

	public init(hex: Int) {
		self = hex2rgb(hex)
	}

	public mutating func set(r: UInt8, g: UInt8, b: UInt8) {
		self.red = r
		self.green = g
		self.blue = b
	}

	public mutating func set(_ red: UInt8, _ green: UInt8, _ blue: UInt8) {
		self.set(r: red, g: green, b: blue)
	}

}

public enum LKFactoryColor {

	public static let red:       LKColor = LKColor(r: 255, g: 10,  b: 10)
	public static let pink:      LKColor = LKColor(r: 255, g: 177, b: 231)
	public static let orange:    LKColor = LKColor(r: 248, g: 100, b: 0)
	public static let yellow:    LKColor = LKColor(r: 255, g: 255, b: 0)
	public static let green:     LKColor = LKColor(r: 0,   g: 100, b: 0)
	public static let turquoise: LKColor = LKColor(r: 80,  g: 227, b: 194)
	public static let cyan:      LKColor = LKColor(r: 91,  g: 204, b: 255)
	public static let blue:      LKColor = LKColor(r: 0,   g: 122, b: 255)
	public static let purple:    LKColor = LKColor(r: 144, g: 19,  b: 254)
	public static let fushia:    LKColor = LKColor(r: 177, g: 0,   b: 106)

	public static let black:     LKColor = LKColor(r: 0,   g: 0,   b: 0)
	public static let white:     LKColor = LKColor(r: 255, g: 255, b: 255)

}

//
// MARK: - Utility Methods
//

/**

Convert HEX value to RGB values

### Usage Example:

```swift
let color = hex2rgb(0xFF2356)
```

- Parameter hex: hex `Int` representing the color`
- Returns: A tuple containing the 3 RGB values of type `LKColor`

*/
func hex2rgb(_ hex: Int) -> LKColor {
	let r = UInt8((hex >> 16) & 0xFF)
	let g = UInt8((hex >> 8)  & 0xFF)
	let b = UInt8((hex >> 0)  & 0xFF)

	return LKColor(r: r, g: g, b: b)
}

/**

Convert HSB value to RGB values

### Usage Example:

```swift
let color = hsb2rgb(h: 145, s: 0.5, b: 0.35)
```

- Parameter h: the angle in degrees (°)
- Parameter s: the saturation value between 0.0..1.0
- Parameter b: the brightness value between 0.0..1.0
- Returns: A tuple containing the 3 RGB values of type `LKColor`

*/
func hsb2rgb(h: Int, s: Float, b: Float) -> LKColor {

//	int r = 0, g = 0, b = 0;
//	if (saturation == 0) {
//		r = g = b = (int) (brightness * 255.0f + 0.5f);
//	} else {
//		float h = (hue - (float)Math.floor(hue)) * 6.0f;
//		float f = h - (float)java.lang.Math.floor(h);
//		float p = brightness * (1.0f - saturation);
//		float q = brightness * (1.0f - saturation * f);
//		float t = brightness * (1.0f - (saturation * (1.0f - f)));
//		switch ((int) h) {
//		case 0:
//			r = (int) (brightness * 255.0f + 0.5f);
//			g = (int) (t * 255.0f + 0.5f);
//			b = (int) (p * 255.0f + 0.5f);
//			break;
//		case 1:
//			r = (int) (q * 255.0f + 0.5f);
//			g = (int) (brightness * 255.0f + 0.5f);
//			b = (int) (p * 255.0f + 0.5f);
//			break;
//		case 2:
//			r = (int) (p * 255.0f + 0.5f);
//			g = (int) (brightness * 255.0f + 0.5f);
//			b = (int) (t * 255.0f + 0.5f);
//			break;
//		case 3:
//			r = (int) (p * 255.0f + 0.5f);
//			g = (int) (q * 255.0f + 0.5f);
//			b = (int) (brightness * 255.0f + 0.5f);
//			break;
//		case 4:
//			r = (int) (t * 255.0f + 0.5f);
//			g = (int) (p * 255.0f + 0.5f);
//			b = (int) (brightness * 255.0f + 0.5f);
//			break;
//		case 5:
//			r = (int) (brightness * 255.0f + 0.5f);
//			g = (int) (p * 255.0f + 0.5f);
//			b = (int) (q * 255.0f + 0.5f);
//			break;
//		}
//	}


//	return LKColor(r: r, g: g, b: b)
	return LKColor(r: 0, g: 0, b: 0)
}

/**

Convert RGB value to HEX values

### Usage Example:

```swift
let hexValue = rgb2hex(255, 34, 25)
```

- Parameter red: Red value, between 0..255
- Parameter green: Green value, between 0..255
- Parameter blue: Blue value, between 0..255
- Returns: `Int` hex value

*/
func rgb2hex(_ red: UInt8, _ green: UInt8, _ blue: UInt8) -> Int {
	return Int(red) << 16 | Int(green) << 8 | Int(blue) << 0
}
