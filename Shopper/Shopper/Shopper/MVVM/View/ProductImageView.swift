//
//  ProductImageView.swift
//  Shopper
//
//  Created by Владимир Василенко on 02.05.2025.
//

import SwiftUI

struct ProductImageView: View {
    let url: String
    
    private var placeholder: some View {
        Rectangle()
            .foregroundStyle(.clear)
            .scaledToFill()
    }
    
    var body: some View {
        if let url = URL(string: url) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(.rect(cornerRadius: 8))
            } placeholder: {
                placeholder
                    .overlay {
                        ProgressView()
                    }
            }
        } else {
            placeholder
                .overlay {
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
        }

    }
}

