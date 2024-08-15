//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import Foundation
import FirebaseAuth

class MainViewModel : ObservableObject {
	@Published var currentUserId: String = ""
	private var handler: AuthStateDidChangeListenerHandle?
	
	init() {
		self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
			DispatchQueue.main.async {
				self?.currentUserId = user?.uid ?? ""
			}
		}
	}
	
	public var isSignedIn: Bool {
		return Auth.auth().currentUser != nil
	}
}
