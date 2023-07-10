//
//  Data + extension.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import Foundation

extension Date {
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d, MMMM yyyy"
        return formatter.string(from: self)
    }
}
