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
	@State var DEFAULT_HOME: String  = "home"

	var body: some View {
		TabView(selection: $DEFAULT_HOME ){
			Group{
				EmergencyView()
					.tabItem {
						Label("Emergency", systemImage: "sos.circle")
					}
					.tag("sos")
				HStack{
					Text("This is part 1")
				}
				.tabItem {
					Label("Explore", systemImage: "safari")
				}
				.tag("explore")
				HStack{
					HomeView()
				}
				.tabItem {
					Label("Home", systemImage: "house")
				}
				.tag("home")
				HStack{
					Text("This is part 1")
				}
				.tabItem {
					Label("Events", systemImage: "calendar.circle")
				}
				.tag("events")
				HStack{
					Text("This is part 1")
				}.tabItem {
					Label("Me", systemImage: "person.crop.circle")
						.background(.blue)
				}
				.tag("profile")
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


