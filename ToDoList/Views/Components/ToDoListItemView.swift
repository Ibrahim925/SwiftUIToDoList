//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI

struct ToDoListItemView: View {
	@StateObject var viewModel = ToDoListItemViewModel()
	
	let item: ToDoListItem
	
    var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(item.title)
					.font(.body)
				Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
					.font(.footnote)
					.foregroundColor(Color(.secondaryLabel))
			}
			
			Spacer()
			
			Button {
				viewModel.toggleCheckMark(item: item)
			} label: {
				Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
					.foregroundColor(.blue)
			}
		}
    }
}

#Preview {
	ToDoListItemView(item: .init(id: "123", title: "Test", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
