//
//  PopUpview.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 09.07.2023.
//

import SwiftUI

struct PopUpView: View {
    
    var dishes: Dish
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(maxHeight: 232)
                        .padding(.all)
                        .background(Color.cyan)
                        .cornerRadius(15)
                        .overlay(alignment: .topTrailing) {
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "heart")
                                        .foregroundColor(.black)
                                        .imageScale(.large)
                                        .padding(.all, 8)
                                        .background(.white)
                                        .cornerRadius(10)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "multiply")
                                        .foregroundColor(.black)
                                        .imageScale(.large)
                                        .padding(.all, 11)
                                        .background(.white)
                                        .cornerRadius(10)
                                }
                            }
                            .padding([.top, .trailing])
                        }
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
            
            Text(dishes.name!)
                .font(.custom("Sfont", size: 22))
            
            HStack {
                Text("\(dishes.price!) P")
                    .font(.custom("Sfont", size: 16))
                Text("\(dishes.weight!) г")
                    .font(.custom("Sfont", size: 16))
                    .opacity(0.5)
            }
            
            Text(dishes.description!)
                .font(.custom("Sfont", size: 16))
                .opacity(0.7)
                
            Button {
                //
            } label: {
                Text("Добавить в корзину")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(maxHeight: 48)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(15)
                    
            }
            .padding(.top, 8)
        }
        .padding()
    
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(dishes: Dishes.sampleDishes)
            
    }
}
