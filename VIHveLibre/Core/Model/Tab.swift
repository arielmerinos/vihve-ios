//
//  Tab.swift
//  VIHve Libre
//
//  Created by Ariel Merino on 24/01/24.
//

import SwiftUI

enum Tab: String, CaseIterable{
	case explore = "Explore"
	case sos = "SOS"
	case home = "Home"
	case events = "Events"
	case profile = "Me"
	
	
	var systemImage: String {
		switch self {
		case .home:
			return "house"
		case .events:
			return "calendar.circle"
		case .explore:
			return "safari"
		case .sos:
			return "sos.circle"
		case .profile:
			return "person.crop.circle"
		}
	}
	
	var index: Int{
		return Tab.allCases.firstIndex(of: self) ?? 0
	}
}
