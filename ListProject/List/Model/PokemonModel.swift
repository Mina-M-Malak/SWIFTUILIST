//
//  ListItem.swift
//  ListProject
//
//  Created by Mina Malak on 30/03/2025.
//

import Foundation

struct Pokemon : Codable{
    var results: [PokemonEntry]
}

struct PokemonEntry : Codable, Identifiable  {
    let id = UUID()
    var name: String
    var url: String
}
