//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
	init() {
		FirebaseApp.configure()
	}
	
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

