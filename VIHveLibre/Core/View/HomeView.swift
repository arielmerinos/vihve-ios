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
		NavigationStack{
			List(data, id: \.id){
				user in
				HStack{
					Text(user.name)
				}
			}
			.onAppear{
				fetchData()
				print(data)
			}
		}
				
		
	}
	
	func fetchData(){
		guard let url = URL(string: "http://localhost:8000/users/") else {return}
		URLSession.shared.dataTask(with: url){ data, response, error in
			if error != nil {return}
			guard let data else {return}
			do {
				let decoder = JSONDecoder()
				let users = try decoder.decode([User].self, from: data)
				DispatchQueue.main.async {
					self.data = users
				}
			} catch{
				print(error.localizedDescription)
			}
		}.resume()
	}
	
}


struct User: Codable {
	let id: Int
	let name: String
	let email: String
	let dateJoined: String
	let isPublicProfile: Bool
	let isOnline: Bool
	let languagePreference: String
	var username: String?
	var profile_picture: String?
	var bio: String?
	var lastLogin: String?
	var status: String?
	var role: String?
	var notification_settings: String?

	enum CodingKeys: String, CodingKey {
		case id, name, email, bio, status, role, username
		case profile_picture = "profile_picture"
		case dateJoined = "date_joined"
		case lastLogin = "last_login"
		case isPublicProfile = "is_public_profile"
		case isOnline = "is_online"
		case languagePreference = "language_preference"
		case notification_settings = "notification_settings"
	}
}





#Preview {
	HomeView()
}
