//
//  AddUserView.swift
//  VIHve Libre
//
//  Created by Ariel Merino on 26/01/24.
//

import SwiftUI

struct AddUserView: View {
	@State private var name: String = ""
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var password_confirmation: String = ""
	
    var body: some View {
		VStack {
			TextFieldy(placeholder: "Name", text: $name)
			TextFieldy(placeholder: "Email", text: $email)
			
			SecureField("Password", text: $password)
				.padding()
				.overlay(
				RoundedRectangle(cornerRadius: 12)
					.stroke(Color.gray))
			SecureField("Password", text: $password_confirmation)
				.padding()
				.overlay(
				RoundedRectangle(cornerRadius: 12)
					.stroke(Color.gray))
			
			
			
			Button{
				createUser(name: name, email: email, password1: password, password2: password_confirmation )
				
			} label: {
				Text("Create User")
					.padding(2.5)
			}
			.padding()
			.background(  LinearGradient(colors: [.orange, .red],
										 startPoint: .top,
		   endPoint: .center))
			.foregroundStyle(.white)
			.fontWeight(.semibold)
			.clipShape(RoundedRectangle(cornerRadius: 12))
		}.padding()
    }
	
	func createUser(name: String, email: String, password1: String, password2: String) {
		guard let url = URL(string: "http://192.168.100.11:8080/users/") else { return }
		
		// Define our user
		let user = NewUser(name: name, email: email, password: password1, password_confirmation: password2)
		
		// Try to encode the user into JSON
		guard let jsonData = try? JSONEncoder().encode(user) else {
			print("Failed to encode user")
			return
		}
		
		// Define our request
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = jsonData
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		// Start the task
		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				print("Error: \(error.localizedDescription)")
				return
			}
			guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
				print(jsonData)
				print("Invalid response")
				return
			}
			print("User created successfully")
		}.resume()
	}
}


struct TextFieldy: View {
	var placeholder: String
	var text: Binding<String>
	var body: some View {
		TextField(placeholder, text: text)
			.padding()
			.overlay(
				RoundedRectangle(cornerRadius: 12)
					.stroke(Color.gray)
			)
	}
}

struct NewUser: Codable {
	let name: String
	let email: String
	let password: String
	let password_confirmation: String
}

#Preview {
    AddUserView()
}
