//
//  ContentView.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isMVVM") private var isMVVM = false
    
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(ShopTabs.allCases, id: \.self) { tab in
                    Tab(tab.rawValue, systemImage: tab.icon) {
                        tab.view
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("", selection: $isMVVM) {
                        Text("MVVM").tag(true)
                        Text("VIPER").tag(false)
                    }
                    .pickerStyle(.segmented)
                }
            }
            .toolbarTitleDisplayMode(.inline)
            .toolbarVisibility(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
