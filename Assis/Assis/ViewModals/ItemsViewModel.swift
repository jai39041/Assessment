//
//  ItemsViewModel.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import Foundation
import Combine

class ItemsViewModel: ObservableObject {
    @Published var items = [Item]()
    @Published var isLoading = false
    @Published var hasMoreData = true
    
    private let apiService = ItemApiService()
    private var currentPage = 1
    private let pageLimit = 10
    
    private var cancellableSet = Set<AnyCancellable>()
    
    init() {
        self.fetchItems()
    }
    
    func fetchItems() {
        guard (self.isLoading == false) && self.hasMoreData else { return }
        self.isLoading = true
        
        self.apiService.fetchPosts(page: self.currentPage, limit: self.pageLimit)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Error fetching posts: \(error)")
                }
                self.isLoading = false
            } receiveValue: { items in
                if items.isEmpty {
                    self.hasMoreData = false
                } else {
                    self.items.append(contentsOf: items)
                    self.currentPage += 1
                }
            }
            .store(in: &cancellableSet)
    }
}


