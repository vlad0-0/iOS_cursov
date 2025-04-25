//
//  ProductServiceProtocol.swift
//  Shopper
//
//  Created by Владимир Василенко on 24.04.2025.
//


import Foundation
import Combine

protocol ProductServiceProtocol {
    func fetchAll() -> AnyPublisher<[Product], Error>
//    func fetchOne(id: Int) -> AnyPublisher<Product, Error>
//    func create(product: ProductCreateRequest) -> AnyPublisher<Product, Error>
//    func update(id: Int, product: ProductUpdateRequest) -> AnyPublisher<Product, Error>
//    func delete(id: Int) -> AnyPublisher<Bool, Error>
}

class ProductService: ProductServiceProtocol {
    private let baseURL = URL(string: "https://api.escuelajs.co/api/v1/products")!
    
    func fetchAll() -> AnyPublisher<[Product], Error> {
        URLSession.shared.dataTaskPublisher(for: baseURL)
            .map(\.data)
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
//    func fetchOne(id: Int) -> AnyPublisher<Product, Error> {
//        let url = baseURL.appendingPathComponent("\(id)")
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map(\.data)
//            .decode(type: Product.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//    
//    func create(product: ProductCreateRequest) -> AnyPublisher<Product, Error> {
//        var request = URLRequest(url: baseURL)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(product)
//        
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .map(\.data)
//            .decode(type: Product.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//    
//    func update(id: Int, product: ProductUpdateRequest) -> AnyPublisher<Product, Error> {
//        var request = URLRequest(url: baseURL.appendingPathComponent("\(id)"))
//        request.httpMethod = "PUT"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(product)
//        
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .map(\.data)
//            .decode(type: Product.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//    
//    func delete(id: Int) -> AnyPublisher<Bool, Error> {
//        var request = URLRequest(url: baseURL.appendingPathComponent("\(id)"))
//        request.httpMethod = "DELETE"
//        
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .tryMap { result -> Bool in
//                guard let httpResp = result.response as? HTTPURLResponse,
//                      httpResp.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//                return true
//            }
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
}
