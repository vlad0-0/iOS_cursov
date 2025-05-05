//
//  ProductDetailView.swift
//  Shopper
//
//  Created by Владимир Василенко on 28.04.2025.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                TabView {
                    ForEach(product.images, id: \.self) { url in
                        ProductImageView(url: url)
                    }
                }
                .tabViewStyle(.page)
                .scaledToFill()
                
                Group {
                    Text(product.title)
                        .font(.title)
                    Text(product.price, format: .currency(code: "EUR"))
                        .font(.headline)
                    Text(product.description)
                        .font(.subheadline)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(product.category.name)
        .toolbar {
            ToolbarItem {
                FavouriteButton(product: product)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ArchitectChangeView()
    }
}
