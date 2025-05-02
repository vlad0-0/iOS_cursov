//
//  FavouriteButton.swift
//  Shopper
//
//  Created by Владимир Василенко on 01.05.2025.
//

import SwiftData
import SwiftUI

struct FavouriteButton: View {
    @Environment(\.modelContext) var modelContext

    let product: Product
    @Query var products: [ProductSwiftData]
    @State private var isDisabled = false

    var body: some View {
        Button {
            withAnimation {
                if products.contains(where: { $0.id == product.id }) {
                    deleteProduct(product)
                } else {
                    addProduct(product)
                }
            }
            Task {
                isDisabled = true
                try? await Task.sleep(nanoseconds: 1_000_000)
                isDisabled = false
            }
        } label: {
            Image(systemName:
                    products.contains(where: { $0.id == product.id }) ? "star.fill" : "star")
                .font(.headline)
        }
        .disabled(isDisabled)
    }
    
    private func addProduct(_ product: Product) {
        let productSwiftData = product.toSwiftData
        modelContext.insert(productSwiftData)
    }
    
    private func deleteProduct(_ product: Product) {
        if let productSwiftData = products.first(where: { $0.id == product.id }) {
            modelContext.delete(productSwiftData)
        }
    }
}

#Preview {
    ContentView()
}
