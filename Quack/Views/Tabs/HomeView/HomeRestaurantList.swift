//
//  HomeViewRestaurantList.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct HomeRestaurantList: View {
    var body: some View {
        VStack(spacing: 32) {
            RestaurantListRanking()
            
            RestaurantOfToday()
            
            RestaurantRecommendation()
        }
    }
}

#Preview {
    HomeRestaurantList()
}
