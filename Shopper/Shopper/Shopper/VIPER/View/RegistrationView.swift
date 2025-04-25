//
//  RegistrationView.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//

import SwiftUI

struct RegistrationView: View {
    @State private var userData = UserData(name: "", email: "")
    let title: String = "Register"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                TextField("Name", text: $userData.name)
                TextField("Email", text: $userData.email)
                
                
                NavigationLink {
                    ConfirmationView(userData: userData)
                } label: {
                    Text(title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.tertiary)
                        .clipShape(.capsule)
                }
                .disabled(userData.isEmpty)
            }
            .font(.largeTitle)
            .padding()
            .onChange(of: userData) { oldValue, newValue in
                print(newValue)
            }
        }
    }
}

extension UserData {
    var isEmpty: Bool {
        name.isEmpty || email.isEmpty || !email.contains("@")
    }
}
