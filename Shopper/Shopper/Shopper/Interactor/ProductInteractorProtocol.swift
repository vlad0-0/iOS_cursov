//
//  ProductInteractorProtocol.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


protocol ProductInteractorProtocol {
    func fetchProducts() -> [Product]
}

class ProductInteractor: ProductInteractorProtocol {
    func fetchProducts() -> [Product] {
        return []
    }
}
