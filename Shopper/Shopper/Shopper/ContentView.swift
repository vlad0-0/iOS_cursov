//
//  ContentView.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ForEach(ShopTabs.allCases, id: \.self) { tab in
                Tab(tab.rawValue, systemImage: tab.icon) {
                    tab.view
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
