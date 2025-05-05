//
//  ArchitectChangeView.swift
//  Shopper
//
//  Created by Владимир Василенко on 24.04.2025.
//

import SwiftUI

struct ArchitectChangeView: View {
    @AppStorage("isMVVM") private var isMVVM = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if isMVVM {
                    ProductGridView()
                } else {
                    ProductListRouter.createModule()
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Picker("", selection: $isMVVM) {
                        Text("MVVM").tag(true)
                        Text("VIPER").tag(false)
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Shopper")
            .toolbarVisibility(.visible, for: .automatic)
        }
    }
}

#Preview {
    NavigationStack {
        ArchitectChangeView()
    }
}
