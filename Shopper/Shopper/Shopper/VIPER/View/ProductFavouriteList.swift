//
//  ProductFavouriteList.swift
//  Shopper
//
//  Created by Владимир Василенко on 24.04.2025.
//

//import SwiftUI
//
//struct ProductFavouriteList: View {
//    let products: [ProductFavouriteList] = []
//    
//    var body: some View {
//        List(products, id: \.self) { product in
//            NavigationLink {
//                ProductDetailView(product: product)
//            } label: {
//                AsyncImage(url: URL(string: product.images[0])) { image in
//                    image.resizable().frame(width: 60, height: 60)
//                } placeholder: {
//                    ProgressView().frame(width: 60, height: 60)
//                }
//                VStack(alignment: .leading) {
//                    Text(product.title).bold()
//                    Text(product.price, format: .currency(code: "EUR"))
//                }
//            }
//        }
//        .onAppear {
//            presenter.loadProducts()
//        }
//    }
//}
