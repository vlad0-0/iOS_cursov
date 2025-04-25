//
//  ProductCreateRequest.swift
//  Shopper
//
//  Created by Владимир Василенко on 24.04.2025.
//


struct ProductCreateRequest: Codable {
    let title: String
    let price: Double
    let description: String
    let categoryId: Int
    let images: [String]
}

struct ProductUpdateRequest: Codable {
    let title: String?
    let price: Double?
    let description: String?
    let images: [String]?
    let categoryId: Int?
}
