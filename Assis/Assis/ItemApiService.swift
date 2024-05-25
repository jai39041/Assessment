//
//  ItemApiService.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import Foundation
import Combine

class ItemApiService: NetworkServiceImpl {
    
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    func fetchPosts(page: Int, limit: Int) -> AnyPublisher<[Item], NetworkError> {
        guard let url = URL(string: "\(baseURL)/posts?_page=\(page)&_limit=\(limit)") else {
            return Fail(error: NetworkError.badURL).eraseToAnyPublisher()
        }
        return self.fetch(url, type: [Item].self)
    }
}

