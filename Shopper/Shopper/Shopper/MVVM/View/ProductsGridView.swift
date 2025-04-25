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
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                ForEach(productPresenter.products) { product in
                    LazyVStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(product.title)
                                .font(.headline)
                                .lineLimit(2)
                            Spacer()
                            Button {
                                // action
                            } label: {
                                Image(systemName: "star")
                                    .font(.headline)
                            }
                        }
                        
                        AsyncImage(url: URL(string: product.images[0])!) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .scaledToFit()
                                .overlay {
                                    ProgressView()
                                }
                        }
                        
                        Text(product.price, format: .currency(code: "EUR"))
                    }
                }
                .padding()
            }
        }
        .task {
            productPresenter.loadProducts()
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
