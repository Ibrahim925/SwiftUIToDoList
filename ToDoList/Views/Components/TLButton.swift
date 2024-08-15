//
//  TLButton.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI

struct TLButton: View {
	let text: String;
	let background: Color;
	let action: () -> Void;

    var body: some View {
		Button {
			// Action
			action();
		} label: {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(background)
				
				Text(text)
					.foregroundColor(.white)
					.bold()
			}
		}
		.padding()
    }
}

#Preview {
	TLButton(text: "TLButton", background: .blue) {
		
	}
}
