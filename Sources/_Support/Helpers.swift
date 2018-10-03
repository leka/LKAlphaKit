//
//  Helpers.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 17/09/2018.
//

import Foundation

/**
Convert array of String to array of UInt8

### Usage Example:

```swift
let myArray1 = string2uint8(["12", "34", "0", "255"])
let myArray2 = string2uint8(["FF", "A3", "3B", "0E"], asHex: true)
```

- Parameter array: String array `[String]`
- Parameter asHex: Pass true if the String values are written as hex number such as `FF`
- Returns: Array of UInt8 `[UInt8]`
*/
public func string2uint8(_ array: [String], asHex: Bool = false) -> [UInt8] {

	if asHex {
		return array.map { value in UInt8(value.replacingOccurrences(of: "0x", with: "", options: NSString.CompareOptions.literal, range: nil), radix: 16)! }
	}

	return array.map { value in	UInt8(value, radix: 10)! }

}

/**
Calculate BSD checksum of UInt8 array

### Usage Example:

```swift
let checksum1 = checksum8([12, 34, 0, 255])
let checksum2 = checksum8([0xFF, 0xA3, 0x3B, 0x0E])
```

- Parameter values: Array of UInt8 - `[UInt8]`
- Returns: Checksum value as `UInt8`
*/
public func checksum8(_ values: [UInt8]) -> UInt8 {

	var checksum: UInt16 = 0

	for value in values {
		checksum = (checksum >> 1) + ((checksum & 1) << 15);
		checksum += UInt16(value);
		checksum &= 0xffff;
	}

	return UInt8(truncatingIfNeeded: checksum)

}
