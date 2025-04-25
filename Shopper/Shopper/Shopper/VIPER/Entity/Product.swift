//
//  Product.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let slug: String?
    let price: Int
    let description: String
    let images: [String]
    let category: Category
}

struct Category: Codable {
    let id: Int
    let name: String
    let image: String
    let slug: String?
}
