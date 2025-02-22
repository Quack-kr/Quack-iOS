//
//  ReviewRestaurant.swift
//  Quack
//
//  Created by 차차 on 2/17/25.
//

import SwiftUI

enum ReviewType {
    case cons, pros
}

struct ReviewRestaurant: View {
    @State var reviewType: ReviewType = .cons

    var body: some View {
        // TODO: cons, pros View 통합하는 방법. 현재는 LazyVGrid 사용하다가 실패함. 사용 시에 GridItems 간의 spacing을 조절할 수 없음.
        switch reviewType {
        case .cons:
            RestaurantCons()
        case .pros:
            RestaurantPros()
        }
    }
}

#Preview {
    ReviewRestaurant()
}
