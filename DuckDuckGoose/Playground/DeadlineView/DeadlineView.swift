//
//  DeadlineView.swift
//  DuckDuckGoose
//
//  Created by misha gezha on 30.05.2025.
//

import SwiftUI

struct DeadlineView: View {
	var body: some View {
		VStack {
			Spacer()
			DeadlineEvent()
			Spacer()
		}
		.padding()
//		.background(
//			Image("chihiro043")
//				.resizable()
//				.aspectRatio(contentMode: .fill)
//		)
	}
}

#Preview {
	DeadlineView()
}
