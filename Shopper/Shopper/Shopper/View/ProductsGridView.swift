//
//  ProductsGridView.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import SwiftUI

struct ProductsGridView: View {
    @StateObject var productPresenter = ProductPresenter()
    
    var body: some View {
        ScrollView {
            let columns = [GridItem(.flexible()), GridItem(.flexible())]
            
            LazyVGrid(columns: columns) {
                ForEach(productPresenter.products, id: \.self) { product in
                    VStack {
                        Text(product.name)
                            .font(.largeTitle)
                        Text("Price: \(product.price)")
                            .padding()
                    }
                    .overlay(alignment: .topTrailing) {
                        Button {
                            // action
                        } label: {
                            Image(systemName: "star")
                        }
                    }
                }
            }
        }
        .onAppear {
//            productPresenter.loadProducts()
        }
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

#Preview {
    ProductsGridView()
}
