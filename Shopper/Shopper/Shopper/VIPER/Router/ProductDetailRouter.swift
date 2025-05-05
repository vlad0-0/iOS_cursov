//
//  ProductDetailRouter.swift
//  Shopper
//
//  Created by Владимир Василенко on 02.05.2025.
//

import SwiftUI

enum ProductDetailRouter {
    static func createModule(with product: Product) -> some View {
        let interactor = ProductDetailInteractor(product: product)
        let presenter = ProductDetailPresenter(interactor: interactor)
        return ProductDetail(presenter: presenter)
    }
}
