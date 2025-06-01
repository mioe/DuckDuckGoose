//
//  DeadlineEvent.swift
//  DuckDuckGoose
//
//  Created by misha gezha on 31.05.2025.
//

import SwiftUI

struct DeadlineEvent: View {
	@State private var isExpanded: Bool = true
	@State private var eventColor: Color = .blue
	
	var body: some View {
		VStack {
			VStack {
				DisclosureGroup(isExpanded: $isExpanded) {
					VStack(alignment: .leading) {
						Text("Hello world")
					}
					.background()
				} label: {
					HStack {
						VStack(alignment: .leading) {
							Text("Fix token refresh issue")
								.fontWeight(.semibold)
							Text("11:10–12:45")
								.font(.subheadline)
						}
						.padding(.leading)
						.overlay(alignment: .leading) {
							VStack(alignment: .leading) {
								Image(systemName: "screwdriver")
									.foregroundColor(.white)
									.padding(.all, 2)
									.background(eventColor)
							}
							.padding(.leading, -16)
						}
						Spacer()
						Button {
							withAnimation {
								isExpanded.toggle()
							}
						} label: {
							Image(systemName: "chevron.up")
								.rotationEffect(.degrees(isExpanded ? 0 : -180))
						}
						.buttonStyle(PlainButtonStyle())
					}
				}
			}
			.padding()
			.background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16))
		}
		.padding(.leading, 4)
		.background {
			ZStack {
				LeftMark()
			}
		}
	}
	
	@ViewBuilder
	private func LeftMark() -> some View {
		VStack {
			CategoryLine()
				.fill(eventColor)
				.clipShape(RoundedRectangle(cornerRadius: 10))
		}.padding(.vertical, 6)
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
