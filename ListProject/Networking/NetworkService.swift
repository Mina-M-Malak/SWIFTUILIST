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

protocol ResponseDecoderProtocol {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}
