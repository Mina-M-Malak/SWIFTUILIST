//
//  NetworkService.swift
//  ListProject
//
//  Created by Mina Malak on 01/04/2025.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: EndpointProtocol) -> AnyPublisher<T, Error>
}

protocol EndpointProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}


extension EndpointProtocol {
    var headers: [String: String]? {
        return nil // Default: no headers
    }

    var parameters: [String: Any]? {
        return nil // Default: no parameters
    }

    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var baseURL: URL {
        URL(string: AppConfiguration.shared.baseURL)!
    }
}

protocol ResponseDecoderProtocol {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}
