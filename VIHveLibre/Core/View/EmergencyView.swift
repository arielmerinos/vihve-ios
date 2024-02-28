//
//  EmergencyView.swift
//  VIHve Libre
//
//  Created by Ariel Merino on 31/01/24.
//

import SwiftUI

struct EmergencyView: View {
    var body: some View {
        EmergencyButton()
    }
}

struct EmergencyButton: View{
	var body: some View{
		Button {
			
		} label: {
			Label("Pedir ayuda", systemImage: "circle.fill")
				.labelStyle(.titleOnly)
				.padding()
				.background(
					LinearGradient(
						colors: [._400, ._500],
						startPoint: .top,
						endPoint: .bottom)
				)
				.clipShape(RoundedRectangle(cornerRadius: 12))
		}
		.font(.title3)
		.fontDesign(.rounded)
		.fontWeight(.bold)
		.foregroundStyle(.white)
		.buttonStyle(PressedButtonEffect())
	}
}

struct PressedButtonEffect: ButtonStyle{
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.scaleEffect(configuration.isPressed ? CGSize(width: 1.0, height: 1.0) : CGSize(width: 1.2, height: 1.2))
		
	}
}

#Preview {
    EmergencyView()
}
