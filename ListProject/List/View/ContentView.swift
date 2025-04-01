//
//  ContentView.swift
//  ListProject
//
//  Created by Mina Malak on 30/03/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var viewModel = ListViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List(searchText.trimmingCharacters(in: .whitespaces).isEmpty ? viewModel.pokemon.results : viewModel.pokemon.results.filter({$0.name.contains(searchText.lowercased())})) { (item) in
                HStack {
                    PokemonImage(imageLink: item.url)
                        .padding(.trailing, 20)
                    
                    Text(item.name)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Poke List")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
