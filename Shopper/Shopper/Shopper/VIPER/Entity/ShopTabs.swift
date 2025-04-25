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
    case cart = "Корзина"
    case profile = "Профиль"
    
    var icon: String {
        switch self {
        case .bag:
            return "bag"
        case .favorites:
            return "star"
        case .cart:
            return "cart"
        case .profile:
            return "person.circle"
        }
    }
    
    @ViewBuilder var view: some View {
        switch self {
        case .bag:
            ArchitectChangeView()
        case .favorites:
            Text("Favorites")
        case .cart:
            UserListView()
        case .profile:
            RegistrationView()
        }
    }
}
