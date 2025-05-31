//
//  DeadlineEvent.swift
//  DuckDuckGoose
//
//  Created by misha gezha on 31.05.2025.
//

import SwiftUI

struct DeadlineEvent: View {
	var body: some View {
		ZStack(alignment: .leading) {
			CategoryLine()
				.fill(.purple)
				.frame(width: 40)
			VStack {
				VStack {
					HStack(alignment: .top) {
						Image(systemName: "screwdriver")
						VStack(alignment: .leading) {
							Text("Fix token refresh issue")
								.fontWeight(.semibold)
							Text("11:10–12:45")
								.font(.subheadline)
						}
						Spacer()
						Image(systemName: "clock")
					}
				}
				.padding()
				.background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16))
				.shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
			}.padding(.leading, 4)
		}
	}
	
	private struct CategoryLine: Shape {
		func path(in rect: CGRect) -> Path {
			let cornerRadius: CGFloat = 10
			let cgPath = CGPath(roundedRect: rect, cornerWidth: cornerRadius, cornerHeight: cornerRadius, transform: nil)
			return Path(cgPath)
		}
	}
}

#Preview {
	VStack {
		DeadlineEvent()
	}
	.frame(width: 500, height: 300)
	.padding()
	.background(
		Image("chihiro043")
			.resizable()
	)
}
