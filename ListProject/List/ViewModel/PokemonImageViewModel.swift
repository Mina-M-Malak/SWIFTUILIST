//
//  PokemonImageViewModel.swift
//  ListProject
//
//  Created by Mina Malak on 01/04/2025.
//

import SwiftUI
import Combine

class PokemonImageViewModel: ObservableObject {
    @State var url: String
    @Published var pokemonSprite: PokemonSelected?
    private var cancellables = Set<AnyCancellable>()
    
    init(url: String) {
        self.url = url
        getSprite()
    }
    
    private func getSprite() {
        NetworkService().request(GetSprite(baseURL: url))
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { sprite in
                self.pokemonSprite = sprite
            })
            .store(in: &cancellables)
    }
}
