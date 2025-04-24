//
//  UserListView.swift
//  Shopper
//
//  Created by Владимир Василенко on 23.04.2025.
//


import SwiftUI

struct UserListView: View {
    @State var users: [User] = []
        
    var body: some View {
        List(users, id: \.name) { user in
            VStack(alignment: .leading) {
                Text("Name: \(user.name)")
                Text("City: \(user.city)")
                Text("Age: \(user.age)")
            }
        }
        .onAppear {
            users = users.loadJSON()
        }
    }
}

#Preview {
    UserListView()
}
