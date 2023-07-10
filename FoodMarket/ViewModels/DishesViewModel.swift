//
//  DishesViewModel.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 08.07.2023.
//

import Foundation
import Combine

final class DishesViewModel: ObservableObject {
    @Published var dishes = [Dish]()
    
    init() {
        getDishes()
    }
    
    func getDishes() {
        ApiService.shared.fetchDishes()
            .sink { (completion) in
                print("Completion is \(completion)")
            } receiveValue: { [weak self] (returnedDishes) in
                self?.dishes = returnedDishes
                print(returnedDishes)
            }
            .store(in: &self.cancellableSet)
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
}
