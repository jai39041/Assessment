//
//  NetworkService.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import Foundation
import Combine

protocol NetworkService {
    func fetch<T: Codable>(_ url: URL, type: T.Type) -> AnyPublisher<T, NetworkError>
}


class NetworkServiceImpl: NetworkService {
    
    func fetch<T>(_ url: URL, type: T.Type) -> AnyPublisher<T, NetworkError> where T : Decodable, T : Encodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .mapError { _ in NetworkError.requestFailed }
            .decode(type: type, decoder: JSONDecoder())
            .mapError { _ in NetworkError.decodingFailed }
            .eraseToAnyPublisher()
    }
    
}
