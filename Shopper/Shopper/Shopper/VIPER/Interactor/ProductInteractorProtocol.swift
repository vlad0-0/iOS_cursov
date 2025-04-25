//
//  ProductInteractorProtocol.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


import Combine
import Foundation

protocol ProductInteractorProtocol {
    func fetchProducts() -> AnyPublisher<[Product], Error>
}

class ProductInteractor: ProductInteractorProtocol {
    private let baseURL = URL(string: "https://api.escuelajs.co/api/v1/products")!
    
    func fetchProducts() -> AnyPublisher<[Product], Error> {
        URLSession.shared.dataTaskPublisher(for: baseURL)
            .map(\.data)
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

protocol ProductListInteractorProtocol {
    func fetchProducts()
}

final class ProductListInteractor: ProductListInteractorProtocol {
    var presenter: ProductListPresenterProtocol?

    func fetchProducts() {
        Task {
            do {
                let url = URL(string: "https://api.escuelajs.co/api/v1/products")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let products = try JSONDecoder().decode([Product].self, from: data)
                presenter?.didFetchProducts(products)
            } catch {
                presenter?.didFailWithError(error)
            }
        }
    }
}
