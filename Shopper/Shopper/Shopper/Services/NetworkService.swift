//
//  NetworkService.swift
//  Shopper
//
//  Created by Владимир Василенко on 02.05.2025.
//


import Combine
import Foundation

protocol NetworkServiceProtocol {
    func fetchProducts() -> AnyPublisher<[Product], APIError>
}

class NetworkService: NetworkServiceProtocol {
    private let baseURL = URL(string: "https://api.escuelajs.co/api/v1/products")!
    
    func fetchProducts() -> AnyPublisher<[Product], APIError> {
        URLSession.shared.dataTaskPublisher(for: baseURL)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                guard (200...299).contains(response.statusCode) else {
                    throw APIError.serverError(code: response.statusCode)
                }
                return result.data
            }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else if error is DecodingError {
                    return .decodingError
                } else {
                    return .unknown
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
