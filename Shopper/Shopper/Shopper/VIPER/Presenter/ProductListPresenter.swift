//
//  ProductListPresenter.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import SwiftUI

protocol ProductListPresenterProtocol {
    func didFetchProducts(_ products: [Product])
    func didFailWithAPIError(_ error: APIError)
}

final class ProductListPresenter: ProductListPresenterProtocol, ObservableObject {
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

    func didFailWithAPIError(_ error: APIError) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
}
