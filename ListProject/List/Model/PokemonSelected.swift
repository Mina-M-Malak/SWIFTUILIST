//
//  PokemonSelected.swift
//  ListProject
//
//  Created by Mina Malak on 01/04/2025.
//

import Foundation

struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites : Codable {
    var data: String?
    
    enum CodingKeys: String, CodingKey {
        case data = "front_default"
    }
}
