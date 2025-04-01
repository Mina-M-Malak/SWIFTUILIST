//
//  PokemonImage.swift
//  ListProject
//
//  Created by Mina Malak on 01/04/2025.
//

import SwiftUI
import Kingfisher
import Combine

struct PokemonImage: View {
    var imageLink = ""
    @StateObject var viewModel: PokemonImageViewModel
    
    init(imageLink: String) {
        self.imageLink = imageLink
        _viewModel = StateObject(wrappedValue: PokemonImageViewModel(url: imageLink))
    }
    
    var body: some View {
        KFImage(URL(string: viewModel.pokemonSprite?.sprites.data ?? ""))
            .placeholder {
                ProgressView()
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
            .scaledToFit()
        
    }
}
