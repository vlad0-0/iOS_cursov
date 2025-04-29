//
//  ProductFavourite.swift
//  Shopper
//
//  Created by Владимир Василенко on 29.04.2025.
//


import SwiftData
import SwiftUI

@Model
class ProductFavourite {
    var product: Product
    
    init(product: Product) {
        self.product = product
    }
}
