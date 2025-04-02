//
//  GetPokeList.swift
//  ListProject
//
//  Created by Mina Malak on 01/04/2025.
//

import Foundation

class GetPokeList: EndpointProtocol {
    
    var path: String { "/pokemon" }
    
    var httpMethod: HTTPMethod { .GET }
    
    var headers: [String : String]? { nil }
    
    var parameters: [String : Any]? {
        ["limit" : "151"]
    }
}
