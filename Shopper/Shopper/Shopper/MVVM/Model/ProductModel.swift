//
//  ProductModel.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


struct ProductModel: Codable, Identifiable {
    let id: Int
    let title: String
    let slug: String?
    let price: Int
    let description: String
    let images: [String]
    let category: CategoryModel
}

struct CategoryModel: Codable {
    let id: Int
    let name: String
    let image: String
    let slug: String?
}
