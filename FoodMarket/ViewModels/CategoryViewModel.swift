//
//  CategoryViewModel.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import Foundation
import Combine

final class CategoryViewModel: ObservableObject {
    
    @Published var categories = [Сategories]()
    
    init() {
        getCategories()
        
    }
    
    func getCategories() {
        ApiService.shared.fetchCategories()
            .sink { (completion) in
                print("Completion is \(completion)")
            } receiveValue: { [weak self] (returnedCategory) in
                self?.categories = returnedCategory
                print(returnedCategory)
            }
            .store(in: &self.cancellableSet)
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
}
