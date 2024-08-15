//
//  RegisterView.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI

struct RegisterView: View {
	@StateObject var viewModel = RegisterViewModel()

	var body: some View {
		VStack {
			// Header
			HeaderView(title: "Register", subtitle: "Start organizing your life", rotationDegrees: -15, backgroundColor: .orange)
			.offset(y: -140)
			
			// Register form
			Form {
				if !viewModel.errorMessage.isEmpty {
					Text(viewModel.errorMessage)
						.foregroundColor(.red)
				}
				
				TextField("Name", text: $viewModel.name)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocorrectionDisabled()

				
				TextField("Email Address", text: $viewModel.email)
					.textFieldStyle(DefaultTextFieldStyle())
					.autocapitalization(.none)
					.autocorrectionDisabled()
				
				SecureField("Password", text: $viewModel.password)
					.textFieldStyle(DefaultTextFieldStyle())
				
				TLButton(text: "Register", background: .blue, action: viewModel.register)
			}
			
			Spacer()
		}
	}
}

#Preview {
    RegisterView()
}
