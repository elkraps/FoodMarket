//
//  ApiService.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import Foundation
import UIKit
import Combine

final class ApiService{
    static let shared = ApiService()
    
    func fetch<T:Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: T.self, decoder: APIConstants.jsonDecoder)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchCategories() -> AnyPublisher<[Сategories], Never> {
        guard let categoryUrlString = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
            return Just([Сategories]()).eraseToAnyPublisher()
        }
        
        return fetch(categoryUrlString)
            .map { (response: Category) -> [Сategories] in
                return response.сategories
            }
            .replaceError(with: [Сategories]())
            .eraseToAnyPublisher()
    }
    
    func fetchDishes() -> AnyPublisher<[Dish], Never> {
        guard let dishesUrlString = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
            return Just([Dish]()).eraseToAnyPublisher()
        }
        
        return fetch(dishesUrlString)
            .map { (response: Dishes) -> [Dish] in
                return response.dishes
            }
            .replaceError(with: [Dish]())
            .eraseToAnyPublisher()
    }
}

