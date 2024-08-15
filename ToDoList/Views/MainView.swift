//
//  ContentView.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel = MainViewModel()
	
    var body: some View {
		if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
			accountView
		} else {
			LogInView()
		}
    }
	
	@ViewBuilder
	var accountView: some View {
		TabView {
			ToDoListView(userId: viewModel.currentUserId)
				.tabItem {
					Label("Home", systemImage: "house")
				}
			
			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person.circle")
				}
		}
	}
}

#Preview {
    MainView()
}
