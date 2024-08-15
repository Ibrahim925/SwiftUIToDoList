import SwiftUI

struct NewItemView: View {
	@StateObject var viewModel: NewItemViewModel
	@Binding var newItemPresented: Bool
	
	init(newItemPresented: Binding<Bool>) {
		// Initialize the @Binding property
		self._newItemPresented = newItemPresented
		
		// Initialize the @StateObject property with the initialized binding
		self._viewModel = StateObject(wrappedValue: NewItemViewModel(newItemPresented: newItemPresented))
	}
	
	var body: some View {
		VStack {
			Text("New Item")
				.bold()
				.font(.system(size: 32))
				.padding(.top, 20)

			Form {
				// Title
				TextField("Title", text: $viewModel.title)
					.textFieldStyle(DefaultTextFieldStyle())
				
				// Due Date
				DatePicker("Due Date", selection: $viewModel.dueDate)
					.datePickerStyle(GraphicalDatePickerStyle())
				
				// Button
				TLButton(text: "Save", background: .pink, action: viewModel.save)
			}
			.alert(isPresented: $viewModel.showAlert) {
				Alert(
					title: Text("Error"), 
					message: Text("Please fill in all fields and select a valid due date")
				)
			}
		}
	}
}

#Preview {
	NewItemView(newItemPresented: Binding(get: { true }, set: { _ in }))
}
