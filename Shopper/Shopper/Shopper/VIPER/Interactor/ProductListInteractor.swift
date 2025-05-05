//
//  ProductListInteractor.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


import Combine

protocol ProductListInteractorProtocol {
    func fetchProducts()
}

final class ProductListInteractor: ProductListInteractorProtocol {
    var presenter: ProductListPresenterProtocol?
    private let networkService = NetworkService()
    private var cancellables = Set<AnyCancellable>()

    func fetchProducts() {
        networkService.fetchProducts()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.presenter?.didFailWithAPIError(error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] products in
                self?.presenter?.didFetchProducts(products)
            })
            .store(in: &cancellables)
    }
}
