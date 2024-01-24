//
//  UserDefaultsManager.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/18/24.
//

import Foundation

class UserDefaultsManager {

	private init() { }
	static let shared = UserDefaultsManager()
	enum UDKey: String {
		case source
		case target
	}
	
	var source: String {
		get {
			return UserDefaults.standard.string(forKey: UDKey.source.rawValue) ?? "ko"
		} set {
			UserDefaults.standard.setValue(newValue, forKey: UDKey.source.rawValue)
		}
	}
}
