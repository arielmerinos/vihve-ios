//
//  MediaContent.swift
//  VIHve Libre
//
//  Created by Ariel Merino on 05/02/24.
//

import Foundation


struct MediaContent{
	var media: [MediaType]
	
	var isValid: Bool{
		return media.count <= 4
	}
}
