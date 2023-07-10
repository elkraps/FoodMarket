//
//  DishesView.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 08.07.2023.
//

import SwiftUI

struct DishesView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedIndex: Int = 0
    @State private var isPresented = false
    
    @ObservedObject var dishesVM = DishesViewModel()
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var dishes: Dish
    
    var body: some View {
        ZStack {
            VStack{
                
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(dishesVM.dishes, id: \.id) { item in
                            DishView(dishes: item)
                                
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton(action: {presentationMode.wrappedValue.dismiss()})
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("Avatar")
                    .frame(width: 44, height: 44)
            }
        }
    }
}



struct CustomBackButton: View {
    let action: ()-> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "arrow.left")
                .padding(.all, 12)
                .foregroundColor(.black)
        }
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView(dishes: Dishes.sampleDishes)
    }
}
