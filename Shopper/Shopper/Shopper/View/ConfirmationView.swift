//
//  ConfirmationView.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


import SwiftUI

struct ConfirmationView: View {
    @State private var isShowingAlert: Bool = false
    let userData: UserData
    let title: String = "Confirmation"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(userData.name)
            Text(userData.email)
            
            Button {
                isShowingAlert = true
            } label: {
                Text(title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.tertiary)
                    .clipShape(.capsule)
            }
        }
        .font(.largeTitle)
        .padding()
        .onChange(of: userData) { oldValue, newValue in
            print(newValue)
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("User Confirmed"),
                message: Text("Thank you for shopping with us."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
