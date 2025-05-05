//
//  ProductDetailPresenter.swift
//  Shopper
//
//  Created by Владимир Василенко on 02.05.2025.
//

import Foundation

protocol ProductDetailPresenterProtocol: ObservableObject {
    var product: Product { get }
}

final class ProductDetailPresenter: ProductDetailPresenterProtocol {
    private let interactor: ProductDetailInteractorProtocol
    
    init(interactor: ProductDetailInteractorProtocol) {
        self.interactor = interactor
    }
    
    var product: Product {
        interactor.product
    }
}
