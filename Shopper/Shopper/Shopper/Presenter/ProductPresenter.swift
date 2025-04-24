//
//  ProductPresenter.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


import SwiftUI

class ProductPresenter: ObservableObject {
    let interactor: ProductInteractorProtocol = ProductInteractor()
    @Published var products: [Product] = [
        Product(id: 0, name: "ksdnfksj", price: 34243),
        Product(id: 1, name: "ksdnfksj", price: 34243),
        Product(id: 2, name: "ksdnfksj", price: 34243),
        Product(id: 3, name: "ksdnfksj", price: 34243),
        Product(id: 4, name: "ks dnfksj", price: 34243),
        Product(id: 5, name: "ksdnfksj", price: 34243),
        Product(id: 6, name: "ksdnfksj", price: 34243),
        Product(id: 7, name: "ksdnfksj", price: 34243),
        Product(id: 8, name: "ksdnfksj", price: 34243),
        Product(id: 9, name: "ksdnfksj", price: 34243),
        Product(id: 10, name: "ksdnfksj", price: 34243)
    ]

//    init(interactor: ProductInteractorProtocol) {
//        self.interactor = interactor
//    }

    func loadProducts() {
        products = interactor.fetchProducts()
    }
}
