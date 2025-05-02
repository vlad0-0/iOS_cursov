//
//  ShopperApp.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import SwiftData
import SwiftUI

@main
struct ShopperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ProductSwiftData.self)
    }
}
