//
//  ProductList.swift
//  Shopper
//
//  Created by Владимир Василенко on 24.04.2025.
//

import SwiftUI

struct ProductList: View {
    @StateObject var presenter: ProductListPresenter
    @State private var showError = false

    var body: some View {
        List(presenter.products) { product in
            NavigationLink {
                ProductDetailRouter.createModule(with: product)
            } label: {
                ProductImageView(url: product.images.first ?? "")
                    .frame(width: 60, height: 60)

                VStack(alignment: .leading) {
                    Text(product.title).bold()
                    Text(product.price, format: .currency(code: "EUR"))
                }
            }
        }
        .onAppear {
            presenter.loadProducts()
        }
        .onReceive(presenter.$errorMessage) { message in
            showError = message != nil
        }
        .alert("Ошибка", isPresented: $showError, actions: {
            Button("ОК", role: .cancel) { }
        }, message: {
            Text(presenter.errorMessage ?? "Неизвестная ошибка")
        })

    }
}
