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
					VStack {
						VStack(spacing: 4) {
							TodoItem(text: "Reproduce the issue-localy")
							TodoItem(text: "Review beckend refresh endpoint")
							TodoItem(text: "Test with expired token scenerio")
						}
						.padding(.vertical, 8)
						.padding(.horizontal, 9)
						Divider()
						HStack {
							Text("Backend")
								.font(.subheadline)
								.foregroundColor(.white)
								.padding(.horizontal, 12)
								.padding(.vertical, 4)
								.background(
									LinearGradient(
										colors: [eventColor.opacity(0.8), eventColor],
										startPoint: .leading,
										endPoint: .bottom
									)
								)
								.clipShape(Capsule())
							Spacer()
						}
						.padding(.top, 6)
					}
				} label: {
					HStack {
						VStack(alignment: .leading) {
							Text("Fix token refresh issue")
								.fontWeight(.semibold)
							Text("11:10–12:45")
								.font(.subheadline)
								.foregroundColor(.secondary)
						}
						.padding(.leading, 18)
						.overlay(alignment: .leading) {
							Image(systemName: "screwdriver")
								.foregroundColor(.white)
								.padding(.all, 4)
								.background(eventColor)
								.padding(.leading, -18)
						}
						Spacer()
						Button {
							withAnimation {
								isExpanded.toggle()
							}
						} label: {
							VStack {
								Image(systemName: "chevron.up")
									.rotationEffect(.degrees(isExpanded ? 0 : -180))
							}
							.padding(.vertical, 9)
							.padding(.horizontal, 6)
							.background(.opacity(0.0000001))
							.clipShape(Circle())
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
	private func TodoItem(text: String = "") -> some View {
		HStack {
			Image(systemName: "checkmark.circle")
				.font(.subheadline)
				.foregroundColor(.secondary)
			Text(text)
				.font(.subheadline)
				.foregroundColor(.secondary)
			Spacer()
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
