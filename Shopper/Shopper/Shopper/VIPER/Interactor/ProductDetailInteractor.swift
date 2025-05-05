//
//  ProductDetailInteractor.swift
//  Shopper
//
//  Created by Владимир Василенко on 02.05.2025.
//

protocol ProductDetailInteractorProtocol {
    var product: Product { get }
}

final class ProductDetailInteractor: ProductDetailInteractorProtocol {
    let product: Product

    init(product: Product) {
        self.product = product
    }
}
