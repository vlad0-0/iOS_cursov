//
//  User.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


import Foundation

struct User: Codable {
    let name: String
    var age: Int
    var city: String
}

extension [User] {
    func loadJSON() -> [User] {
        if let url = Bundle.main.url(forResource: "users", withExtension: "json") {
            do {
                let data: Data = try Data(contentsOf: url)
                let decoder = try JSONDecoder().decode([User].self, from: data)
                
                return decoder
            } catch {
                print("ERROR")
            }
        }
            
        return []
    }
}
