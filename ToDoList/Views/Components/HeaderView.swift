//
//  HeaderView.swift
//  ToDoList
//
//  Created by Ibrahim Khawar on 2024-08-14.
//

import SwiftUI

struct HeaderView: View {
	let title: String
	let subtitle: String
	let rotationDegrees: Double
	let backgroundColor: Color
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 0)
				.foregroundColor(backgroundColor)
				.rotationEffect(Angle(degrees: rotationDegrees))
			
			VStack {
				Text(title)
					.font(.system(size: 50))
					.foregroundColor(.white)
					.bold()
				Text(subtitle)
					.font(.system(size: 30))
					.foregroundColor(.white)
			}
			.padding(.top, 30)
		}
		.frame(width: UIScreen.main.bounds.width * 2, height: 300)
    }
}

#Preview {
	HeaderView(title: "Title", subtitle: "Subtitle", rotationDegrees: 15, backgroundColor: .blue)
}
