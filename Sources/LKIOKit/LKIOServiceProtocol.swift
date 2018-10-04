//
//  LKTransferServiceProtocol.swift
//  LekaAlphaControlCore
//
//  Created by Ladislas de Toldi on 14/09/2018.
//

import Foundation

public enum LKIOServiceType: String {
	case cli = "CLI"
	case uart = "UART"
	case ble = "BLE"
}

public protocol LKIOServiceProtocol {

	var type: LKIOServiceType {get set}
	func send(data: [UInt8])
	func send(frame: LKCommandFrame)
	func onReceive()

}

public extension LKIOServiceProtocol {

	func send(data: [UInt8]) {
		send(frame: LKCommandFrame(data: data))
	}

	func send(frame: LKCommandFrame) {
		print("Sent from \(type.rawValue)")
		print(frame.info)
	}

	func onReceive() {
		print("Something was received")
	}

}
