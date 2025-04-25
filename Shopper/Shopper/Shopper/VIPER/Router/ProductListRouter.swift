//
//  ProductListRouter.swift
//  Shopper
//
//  Created by Владимир Василенко on 24.04.2025.
//

import SwiftUI

enum ProductListRouter {
    static func createModule() -> some View {
        let presenter = ProductListPresenter()
        let interactor = ProductListInteractor()
        presenter.interactor = interactor
        interactor.presenter = presenter

        return ProductListView(presenter: presenter)
    }
}
