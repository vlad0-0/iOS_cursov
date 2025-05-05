//
//  ProductFavoriteList.swift
//  Shopper
//
//  Created by Владимир Василенко on 01.05.2025.
//

import SwiftUI

struct ProductFavoriteList: View {
    @State private var sortOrder = SortDescriptor(\ProductSwiftData.title)
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ProductFavoriteListing(sort: sortOrder, searchString: searchText)
                .searchable(text: $searchText, prompt: "Search")
                .navigationTitle("Favorites")
        }
    }
}

#Preview {
    ProductFavoriteList()
}
