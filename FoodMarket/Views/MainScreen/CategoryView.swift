//
//  CategoryView.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import SwiftUI

struct CategoryView: View {
    
//    @ObservedObject var categoryVM = CategoryViewModel()
    var categories: Сategories
    
    var body: some View {
        
        HStack {
            AsyncImage(url: categories.urlToImage) {
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
        }
        .frame(minHeight: 200, maxHeight: 300)
        
        .clipped()
        .overlay(alignment: .leading, content: {
            VStack(alignment: .leading){
                Text("\(categories.name != nil ? categories.name! : "")")
                    .font(.custom("Sfont", size: 20))
                    .padding(.top, -60)
                    .padding(.leading)
                
            }
        })
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryView(categories: Category.sampleCategory)
        
        
    }
}
