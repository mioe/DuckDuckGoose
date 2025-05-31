//
//  DeadlineEvent.swift
//  DuckDuckGoose
//
//  Created by misha gezha on 31.05.2025.
//

import SwiftUI

struct DeadlineEvent: View {
	var body: some View {
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
		}
		.padding(.leading, 4)
		.overlay {
			ZStack {
				LeftMark()
			}
		}
	}
	
	@ViewBuilder
	private func LeftMark() -> some View {
		VStack {
			CategoryLine()
				.fill(.green)
				.clipShape(RoundedRectangle(cornerRadius: 16))
		}.padding(.vertical, 4)
	}
	
	private struct CategoryLine: Shape {
		func path(in rect: CGRect) -> Path {
			var p = Path()
			
			p.move(to: CGPoint(x: 0, y: 0))
			p.addLine(to: CGPoint(x: rect.width * 0.6, y: 0))
			
			p.addArc(
				center: CGPoint(x: rect.width * 0.1, y: rect.height / 2),
				radius: rect.height / 2,
				startAngle: .degrees(-90),
				endAngle: .degrees(90),
				clockwise: false
			)
			
			p.addLine(to: CGPoint(x: 0, y: rect.height))
			p.closeSubpath()
			
			return p
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
