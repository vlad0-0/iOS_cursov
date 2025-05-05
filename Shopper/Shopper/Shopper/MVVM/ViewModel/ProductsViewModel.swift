//
//  ProductsViewModel.swift
//  Shopper
//
//  Created by Владимир Василенко on 02.05.2025.
//

import Combine
import SwiftUI

class ProductsViewModel: ObservableObject {
    let networkService = NetworkService()
    @Published var products: [Product] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()

    func loadProducts() {
        networkService.fetchProducts()
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
