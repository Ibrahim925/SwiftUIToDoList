//
//  User.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import Foundation

struct User : Codable {
	let id: String
	let name: String
	let email: String
	let joined: TimeInterval
}
