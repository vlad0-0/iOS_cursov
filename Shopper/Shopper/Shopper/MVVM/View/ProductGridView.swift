//
//  ProductGridView.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import SwiftData
import SwiftUI

struct ProductGridView: View {
    @StateObject var productViewModel = ProductsViewModel()
    @State private var showingErrorAlert = false
    
    private func productButton(_ product: Product) -> some View {
        NavigationLink {
            ProductDetailView(product: product)
        } label: {
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                ProductImageView(url: product.images.first ?? "")
                
                HStack {
                    Text(product.price, format: .currency(code: "EUR"))
                    Spacer()
                    FavouriteButton(product: product)
                }
                
            }
        }
    }
    
    var body: some View {
        ScrollView {
            let columns = [GridItem(.flexible()), GridItem(.flexible())]
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                ForEach(productViewModel.products) { product in
                    productButton(product)
                }
                .padding()
            }
        }
        .task {
            productViewModel.loadProducts()
        }
        .onReceive(productViewModel.$errorMessage) { error in
            showingErrorAlert = error != nil
        }
        .alert("Ошибка", isPresented: $showingErrorAlert, actions: {
            Button("OK", role: .cancel) {
                productViewModel.loadProducts()
            }
        }, message: {
            Text(productViewModel.errorMessage ?? "Отсутствует интернет соединение")
        })
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

#Preview {
    NavigationStack {
        ProductGridView()
    }
}
