//
//  ProductFavoriteListing.swift
//  Shopper
//
//  Created by Владимир Василенко on 24.04.2025.
//

import SwiftData
import SwiftUI

struct ProductFavoriteListing: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\ProductSwiftData.price, order: .reverse), SortDescriptor(\ProductSwiftData.title)]) var products: [ProductSwiftData]
    
    var body: some View {
        List {
            ForEach(products) { product in
                NavigationLink {
                    ProductDetailView(product: product.toProduct)
                } label: {
                    ProductImageView(url: product.images.first?.url ?? "")
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading) {
                        Text(product.title).bold()
                        Text(product.price, format: .currency(code: "EUR"))
                    }
                }
            }
            .onDelete(perform: deleteProducts)
        }
    }
    
    init(sort: SortDescriptor<ProductSwiftData>, searchString: String) {
        _products = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.title.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteProducts(_ indexSet: IndexSet) {
        for index in indexSet {
            let product = products[index]
            modelContext.delete(product)
        }
    }
}
