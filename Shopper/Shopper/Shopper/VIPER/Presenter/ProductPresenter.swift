//
//  ProductPresenter.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import Combine
import SwiftUI

class ProductPresenter: ObservableObject {
    let interactor: ProductInteractorProtocol = ProductInteractor()
    @Published var products: [Product] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()

//    init(interactor: ProductInteractorProtocol) {
//        self.interactor = interactor
//    }

    func loadProducts() {
        interactor.fetchProducts()
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] products in
                self?.products = products
            }
            .store(in: &cancellables)
    }
}

protocol ProductListPresenterProtocol {
    func didFetchProducts(_ products: [Product])
    func didFailWithError(_ error: Error)
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

    func didFailWithError(_ error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
}
