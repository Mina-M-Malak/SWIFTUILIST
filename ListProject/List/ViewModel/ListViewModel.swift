//
//  ListViewModel.swift
//  ListProject
//
//  Created by Mina Malak on 30/03/2025.
//

import SwiftUI
import Combine

class ListViewModel: ObservableObject {
    @Published var pokemon = Pokemon(results: [])
    @Published var errorMessage: String?
    
    private let networkService: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
        fetchList()
    }
    
    private func fetchList() {
        networkService.request(GetPokeList())
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { pokemon in
                self.pokemon = pokemon
            })
            .store(in: &cancellables)
    }
}
