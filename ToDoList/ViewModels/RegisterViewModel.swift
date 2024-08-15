//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel : ObservableObject {
	@Published var name: String = ""
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var errorMessage: String = ""
	
	init() { }
	
	func register() {
		errorMessage = ""
		
		guard validate() else {
			return
		}
		
		Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
			guard let userId = result?.user.uid else {
				return
			}
			
			self?.insertUserRecord(id: userId)
		}
	}
	
	private func insertUserRecord(id: String) {
		let newUser = User(id: id, name: name, email: email, joined: Date.timeIntervalBetween1970AndReferenceDate)
		
		let db = Firestore.firestore()
		
		db.collection("users")
			.document(id)
			.setData(newUser.asDictionary())
	}
	
	private func validate() -> Bool{
		guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
			  !password.trimmingCharacters(in: .whitespaces).isEmpty &&
			  !name.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "Please fill in all fields."
			return false
		}
		
		guard email.contains("@") && email.contains(".") else {
			errorMessage = "Please enter a valid email."
			return false
		}
		
		guard password.count >= 6 else {
			errorMessage = "Password must be as least 6 characters."
			return false
		}
		
		return true
	}
}
