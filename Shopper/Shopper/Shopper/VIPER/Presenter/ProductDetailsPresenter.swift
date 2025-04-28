//
//  ProductDetailsPresenterProtocol.swift
//  Shopper
//
//  Created by Владимир Василенко on 25.04.2025.
//

import SwiftUI

protocol ProductDetailsPresenterProtocol {
    func didFetchProducts(_ products: [Product])
    func didFailWithError(_ error: Error)
}

final class ProductDetailsPresenter: ProductDetailsPresenterProtocol, ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String?

    var interactor: ProductListInteractorProtocol?

    func loadProducts() {
        interactor?.fetchProducts()
    }

    func didFetchProducts(_ products: [Product]) {
        DispatchQueue.main.async {
            self.products = products
        }
    }

    func didFailWithError(_ error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
}
