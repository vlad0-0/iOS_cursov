//
//  ShopTabs.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import SwiftUI

enum ShopTabs: String, CaseIterable {
    case bag = "Продукты"
    case favorites = "Избранное"
    
    var icon: String {
        switch self {
        case .bag:
            return "bag"
        case .favorites:
            return "star"
        }
    }
    
    @ViewBuilder var view: some View {
        switch self {
        case .bag:
            ArchitectChangeView()
        case .favorites:
            ProductFavoriteList()
        }
    }
}
