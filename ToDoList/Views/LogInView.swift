//
//  LogInView.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI

struct LogInView: View {	
	@StateObject var viewModel = LogInViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				// Header
				HeaderView(title: "To Do List", subtitle: "Get things done", rotationDegrees: 15, backgroundColor: .pink)
				.offset(y: -100)
				
				// Log in form
				Form {
					if !viewModel.errorMessage.isEmpty {
						Text(viewModel.errorMessage)
							.foregroundColor(.red)
					}
					
					TextField("Email Address", text: $viewModel.email)
						.textFieldStyle(DefaultTextFieldStyle())
						.autocapitalization(.none)
						.autocorrectionDisabled()
					
					SecureField("Password", text: $viewModel.password)
						.textFieldStyle(DefaultTextFieldStyle())
					
					TLButton(text: "Log In", background: .blue, action: viewModel.logIn)
				}
				// Create account
				VStack {
					Text("New around here?")
					NavigationLink("Create an account", destination: RegisterView())
				}
				.padding(.vertical, 20)
				
				Spacer()
			}
		}
	}
}

#Preview {
    LogInView()
}
