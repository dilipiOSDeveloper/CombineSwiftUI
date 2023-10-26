//
//  User.swift
//  CombineSwiftUI
//
//  Created by Dilip Tiwari on 05/09/23.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    // Add other properties as needed
}
