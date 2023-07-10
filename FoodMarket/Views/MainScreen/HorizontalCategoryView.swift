//
//  HorizontalCategoryView.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 10.07.2023.
//

import SwiftUI

struct HorizontalCategoryView: View {
    
    @State private var selectedIndex: Int = 0
    
    var dishes: Dish
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< dishes.tegs!.count) { item in
                    HCategoryView(isActive: item == selectedIndex, text: dishes.tegs![item])
                        .onTapGesture {
                            selectedIndex = item
                        }
                }
            }
        }
    }
}

struct HCategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(isActive ? Color(.black) : Color.black.opacity(0.5))
            
            if (isActive) {
                Color(.black)
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
    }
}

struct HorizontalCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCategoryView(dishes: Dishes.sampleDishes)
    }
}
