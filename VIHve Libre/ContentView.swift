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
    @Query private var items: [Item]

	var body: some View {
		TabView{
			Group{
				HStack{
					HomeView()
				}.tabItem {
					Label("Emergency", systemImage: "sos.circle")
				}
				HStack{
					Text("This is part 1")
				}.tabItem {
					Label("Explore", systemImage: "safari")
				}
				HStack{
					Text("This is part 1")
				}.tabItem {
					Label("Home", systemImage: "house")
				}
				HStack{
					Text("This is part 1")
				}.tabItem {
					Label("Events", systemImage: "calendar.circle")
				}
				HStack{
					Text("This is part 1")
				}.tabItem {
					Label("Me", systemImage: "person.crop.circle")
						.background(.blue)
				}
			}
			.toolbarBackground(.visible, for: .tabBar)
			.toolbarBackground(.visible, for: .tabBar)
		}
	}
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


