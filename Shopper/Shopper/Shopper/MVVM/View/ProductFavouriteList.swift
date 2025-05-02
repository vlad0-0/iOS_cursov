//
//  ProductFavouriteList.swift
//  Shopper
//
//  Created by Владимир Василенко on 01.05.2025.
//

import SwiftUI

struct ProductFavouriteList: View {
    @State private var sortOrder = SortDescriptor(\ProductSwiftData.title)
    @State private var searchText = ""

    var body: some View {
        ProductFavouriteListing(sort: sortOrder, searchString: searchText)
            .searchable(text: $searchText, prompt: "Search")
    }
}

#Preview {
    ProductFavouriteList()
}
