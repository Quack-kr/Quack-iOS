//
//  ReviewContent.swift
//  Quack
//
//  Created by 차차 on 2/17/25.
//

import SwiftUI

struct ReviewContent: View {
    var body: some View {
            
            NavigationStack {
                ScrollView {
                    VStack {
                        ReviewRestaurant()
//                        ReviewMenu()
                    }
                }
                .scrollIndicators(.hidden)
                .background(Color.background)
            }        
    }
}

#Preview {
    ReviewContent()
}
