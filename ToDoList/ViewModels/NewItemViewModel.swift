import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class NewItemViewModel: ObservableObject {
	@Published var title: String = ""
	@Published var dueDate: Date = Date()
	@Published var showAlert = false
	
	var newItemPresented: Binding<Bool>
	
	init(newItemPresented: Binding<Bool>) {
		self.newItemPresented = newItemPresented
	}
	
	func save() {
		guard canSave else {
			showAlert = true
			return
		}
		
		// Get current user ID
		guard let userId = Auth.auth().currentUser?.uid else {
			return
		}

		// Create model
		let newId = UUID().uuidString
		let newToDo = ToDoListItem(
			id: newId,
			title: title,
			dueDate: dueDate.timeIntervalSince1970,
			createdDate: Date().timeIntervalSince1970,
			isDone: false
		)
		
		// Save model
		let db = Firestore.firestore()
			
		db.collection("users")
			.document(userId)
			.collection("todos")
			.document(newId)
			.setData(newToDo.asDictionary())
		
		newItemPresented.wrappedValue = false
	}
	
	var canSave: Bool {
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
			return false
		}
		
		guard dueDate >= Date().addingTimeInterval(-86400) else {
			return false
		}
		
		return true
	}
}
