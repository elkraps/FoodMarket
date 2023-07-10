//
//  ContentView.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectTab = "Home"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectTab) {
                MainView()
                    .tabItem {
                        Label("Главная", image: "Главная")
                    }
                    .tag("Home")
                EmptyView()
                    .tabItem {
                        Label("Поиск", image: "Поиск")
                    }
                    .tag("Home")
                EmptyView()
                    .tabItem {
                        Label("Корзина", image: "Корзина")
                    }
                    .tag("Home")
                EmptyView()
                    .tabItem {
                        Label("Аккаунт", image: "Аккаунт")
                    }
                    .tag("Home")
            }
            .tint(.blue)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
