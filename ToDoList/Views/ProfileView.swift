//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI

struct ProfileView: View {
	@StateObject var viewModel = ProfileViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				if let user = viewModel.user {
					profile(of: user)
				} else {
					Text("Loading Profile...")
				}
			}
			.navigationTitle("Profile")
		}
		.onAppear {
			viewModel.fetchUser()
		}
    }
	
	@ViewBuilder
	func profile(of user: User) -> some View {
		VStack {
			// Avatar
			Image(systemName: "person.circle")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.foregroundColor(.blue)
				.frame(width: 125, height: 125)
				.padding()

			// Info: Name, Email, Member since
			VStack(alignment: .leading) {
				HStack {
					Text("Name: ")
						.bold()
					Text(user.name)
				}
				.padding()
				
				HStack {
					Text("Email: ")
						.bold()
					Text(user.email)
				}
				.padding()
				
				HStack {
					Text("Member Since: ")
						.bold()
					Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
				}
				.padding()
			}
			.padding()

			Button("Log Out", action: viewModel.logOut)
			.foregroundColor(.red)
			.padding()
			
			Spacer()
		}
	}
}

#Preview {
    ProfileView()
}
