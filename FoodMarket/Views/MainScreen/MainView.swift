//
//  MainView.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedIndex: Int = 0

    @ObservedObject var categoryVM = CategoryViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                DateLocalView()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach(categoryVM.categories, id: \.id) { i in
                            NavigationLink(
                                destination: EmptyView()) {
                                    CategoryView(categories: i)

                            }
                            .navigationBarBackButtonHidden(true)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
