//
//  UserListViewModel.swift
//  CombineSwiftUI
//
//  Created by Dilip Tiwari on 05/09/23.
//

import Foundation
import Combine

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    private var cancellables: Set<AnyCancellable> = []

    func fetchUsers() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .replaceError(with: []) // Handle errors by providing an empty array
            .receive(on: DispatchQueue.main)
            .sink { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}
