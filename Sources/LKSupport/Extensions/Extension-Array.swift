//
//  Array-Extension.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 17/09/2018.
//

import Foundation

public extension Array where Element: UnsignedInteger {

	public func asString(separator: String = "", format: String = "%d", prefix: String = "", suffix: String = "") -> String {
		return "\(prefix)\(self.map { element in String(format: format, element as! CVarArg) }.joined(separator: separator))\(suffix)"
	}

	public var asHexString: String {
		return self.asString(separator: " ", format: "%02X")
	}

	public var asHexArray: String {
		return self.asString(separator: ", ", format: "0x%02X", prefix: "[", suffix: "]")
	}

	public var asUInt8String: String {
		return self.asString(separator: " ", format: "%d")
	}

	public var asUInt8Array: String {
		return self.asString(separator: ", ", format: "%d", prefix: "[", suffix: "]")
	}

}
