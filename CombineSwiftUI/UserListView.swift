//
//  UserListView.swift
//  CombineSwiftUI
//
//  Created by Dilip Tiwari on 05/09/23.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel = UserListViewModel()

    var body: some View {
        List(viewModel.users) { user in
            VStack {
                //Text("* \(user.id)")
                Text("\(user.id)* \(user.title)")
                Text(user.description)
            }
            .padding(.leading, 8)
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
