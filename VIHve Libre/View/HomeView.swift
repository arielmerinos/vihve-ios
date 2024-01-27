//
//  HomeView.swift
//  VIHve Libre
//
//  Created by Ariel Merino on 24/01/24.
//

import SwiftUI


struct HomeView: View {
	@State private var data: [User] = []
	
	var body: some View {
		Section{
			List(data, id: \.id){
				user in
				HStack{
					Text(user.name)
				}
			}
			.onAppear{
				fetchData()
			}
		}
		
		
	}
	
	func fetchData(){
		guard let url = URL(string: "http://192.168.100.11:8080/users/") else {return}
		URLSession.shared.dataTask(with: url){ data, response, error in
			if let error = error {
				print("Network error: \(error.localizedDescription)")
				return
			}
			guard let data = data else {
				print("Data is missing")
				return
			}
			do {
				let users = try JSONDecoder().decode([User].self, from: data)
				DispatchQueue.main.async {
					self.data = users.sorted(by: { user1, user2 in
						user1.name < user2.name
					})
				}
			} catch{
				print("Catching some error")
				print(error.localizedDescription)
			}
		}.resume()
	}
	
}


struct User: Codable {
	let id: Int
	let name: String
	let email: String
}


#Preview {
	HomeView()
}
