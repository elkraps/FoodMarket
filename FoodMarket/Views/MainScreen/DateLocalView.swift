//
//  DateLocalView.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import SwiftUI

struct DateLocalView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            Image("Pin")
            
            VStack(alignment: .leading) {
                Text("Санкт-Петербург")
                    .font(.custom("Sfont", size: 18))
                Text(Date.now.formatDate())
                    .font(.custom("Sfont", size: 16.1))
                    .opacity(0.5)
            }
            
            Spacer()
            
            Image("Avatar")
                .frame(width: 44, height: 44)
                
                
        }
    }
}

struct DateLocalView_Previews: PreviewProvider {
    static var previews: some View {
        DateLocalView()
    }
}
