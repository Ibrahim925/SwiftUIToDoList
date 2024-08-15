//
//  LogInViewModel.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import Foundation
import FirebaseAuth

class LogInViewModel : ObservableObject {
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var errorMessage = ""
	
	func logIn() {
		errorMessage = ""
		
		guard validate() else {
			return
		}
		
		Auth.auth().signIn(withEmail: email, password: password)
	}
	
	private func validate() -> Bool {
		guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
			  !password.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "Please fill in all fields."
			return false
		}
		
		guard email.contains("@") && email.contains(".") else {
			errorMessage = "Please enter a valid email."
			return false
		}
		
		return true
	}
}
