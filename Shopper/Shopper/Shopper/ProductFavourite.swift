//
//  ProductFavourite.swift
//  Shopper
//
//  Created by Владимир Василенко on 29.04.2025.
//


import SwiftData
import SwiftUI

@Model
class ProductSwiftData {
    var id: Int
    var title: String
    var slug: String?
    var price: Int
    var desc: String
    var images: [String]
    @Relationship(deleteRule: .cascade) var category: CategorySwiftData
    
    init(id: Int, title: String, slug: String? = nil, price: Int, desc: String, images: [String], category: CategorySwiftData) {
        self.id = id
        self.title = title
        self.slug = slug
        self.price = price
        self.desc = desc
        self.images = images
        self.category = category
    }
}

extension ProductSwiftData {
    var toProduct: Product {
        .init(
            id: id,
            title: title,
            slug: slug ?? "",
            price: price,
            description: desc,
            images: images,
            category: category.toCategory
        )
    }
}

@Model
class CategorySwiftData {
    var id: Int
    var name: String
    var image: String
    var slug: String?
    
    init(id: Int, name: String, image: String, slug: String? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.slug = slug
    }
}

extension CategorySwiftData {
    var toCategory: Category {
        .init(
            id: id,
            name: name,
            image: image,
            slug: slug ?? ""
        )
    }
}
