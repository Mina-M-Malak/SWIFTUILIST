//
//  GetSprite.swift
//  ListProject
//
//  Created by Mina Malak on 01/04/2025.
//

import Foundation

class GetSprite: EndpointProtocol {
    let baseURL: URL
    
    var path: String { "" }
    
    var httpMethod: HTTPMethod { .GET }
    
    var headers: [String : String]? { nil }
    
    var parameters: [String : Any]? { nil }
    
    init(baseURL: String) {
        self.baseURL = URL(string: baseURL)!
    }
}
