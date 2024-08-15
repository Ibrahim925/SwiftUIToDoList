//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel : ObservableObject {
	@Published var showingNewItemView: Bool = false
	
	private let userId: String;
	
	init(userId: String) {
		self.userId = userId
	}
	
	func delete(id: String) {
		let db = Firestore.firestore()
		
		db.collection("users")
			.document(userId)
			.collection("todos")
			.document(id)
			.delete()
	}
}
