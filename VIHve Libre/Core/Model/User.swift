//
//  User.swift
//  VIHve Libre
//
//  Created by Ariel Merino on 31/01/24.
//

import Foundation

struct UserModel: Codable, Hashable{
	var id: UUID = UUID()
	var name: String
	var username: String
	var isActive: Bool
	var img: String
	var followers: Int
}


