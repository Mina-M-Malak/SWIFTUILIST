//
//  DefaultNetworkService.swift
//  ListProject
//
//  Created by Mina Malak on 01/04/2025.
//

import Foundation
import Combine

struct NetworkService: NetworkServiceProtocol {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T: Decodable>(_ endpoint: EndpointProtocol) -> AnyPublisher<T, Error> {
        guard let urlRequest = createURLRequest(from: endpoint) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Ensure UI updates on the main thread
            .eraseToAnyPublisher()
    }

    private func createURLRequest(from endpoint: EndpointProtocol) -> URLRequest? {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.allHTTPHeaderFields = endpoint.headers

        if let parameters = endpoint.parameters, !parameters.isEmpty {
            if endpoint.httpMethod.rawValue == "GET" {
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
                request.url = components?.url
            } else if let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                request.httpBody = httpBody
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        return request
    }
}

struct JSONDecoderResponseDecoder: ResponseDecoderProtocol {
    func decode<T: Decodable>(_ data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
