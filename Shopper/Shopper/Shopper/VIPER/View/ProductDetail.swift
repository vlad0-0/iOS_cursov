//
//  ProductDetail.swift
//  Shopper
//
//  Created by Владимир Василенко on 02.05.2025.
//

import SwiftUI

struct ProductDetail: View {
    @ObservedObject var presenter: ProductDetailPresenter

    var body: some View {
        ProductDetailView(product: presenter.product)
    }
}
