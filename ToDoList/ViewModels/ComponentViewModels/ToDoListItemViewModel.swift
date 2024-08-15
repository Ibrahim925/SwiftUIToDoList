//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel : ObservableObject {
	init() { }
	
	func toggleCheckMark(item: ToDoListItem) {
		var newItem = item
		newItem.setDone(!item.isDone)
		
		guard let userId = Auth.auth().currentUser?.uid else {
			return
		}
		
		let db = Firestore.firestore()
		
		db.collection("users")
			.document(userId)
			.collection("todos")
			.document(item.id)
			.setData(newItem.asDictionary())
	}
}
