//
//  ContentView.swift
//  VIHve Libre
//
//  Created by Ariel Merino on 17/01/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
	@State var DEFAULT_HOME: String  = "home"
	/// View Properties
	@State private var activeTab: Tab = .home

	var body: some View {
		NavigationStack{
			VStack(spacing: 15){
				SegmentedControl(
					tabs: Tab.allCases,
					activeTab: $activeTab,
					font: .body,
					activeTint: ._500,
					inactiveTint: .gray.opacity(0.5)
				){ size in
					Rectangle()
						.fill(.blue)
						.frame(height: 4)
						.padding(.horizontal, 10)
						.frame(maxHeight: .infinity, alignment: .bottom)
					
				}
				
				Spacer(minLength: 0)
				
			}
			.navigationTitle("VIHve Libre")

		}
	}
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


