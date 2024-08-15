//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
	@StateObject var viewModel: ToDoListViewModel
	@FirestoreQuery var items: [ToDoListItem]
		
	init(userId: String) {
		self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
		self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
	}
	
    var body: some View {
		NavigationView {
			VStack {
				List(items) { item in
					ToDoListItemView(item: item)
						.swipeActions {
							Button(role: .destructive) {
								viewModel.delete(id: item.id)
							} label: {
								Text("Delete")
							}
							.tint(.red)
						}
				}
				.listStyle(PlainListStyle())
			}
			.navigationTitle("To Do List")
			.toolbar {
				Button {
					viewModel.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $viewModel.showingNewItemView, content: {
				NewItemView(newItemPresented: $viewModel.showingNewItemView)
			})
		}
    }
}

#Preview {
	ToDoListView(userId: "l3ZHXzkitmcmSScoSmS7xovqUvd2")
}
