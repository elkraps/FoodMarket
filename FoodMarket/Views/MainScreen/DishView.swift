//
//  DishView.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 09.07.2023.
//

import SwiftUI

struct DishView: View {
    
    var dishes: Dish
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                AsyncImage(url: dishes.urlToImage) {
                    phase in
                    switch phase {
                    case .empty:
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
                    case .failure:
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                                .imageScale(.large)
                            Spacer()
                        }
                    @unknown default:
                        fatalError()
                    }
                }
                .background(Color.pink)
                .cornerRadius(20)
                
                Text(dishes.name!)
                    .font(.custom("Sfont", size: 14))
                
            }
        }
        .frame(width: 109, height: 129)
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(dishes: Dishes.sampleDishes)
    }
}
