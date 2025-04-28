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
        Group {
            if isMVVM {
                ProductsGridView()
            } else {
                ProductListRouter.createModule()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ArchitectChangeView()
    }
}
