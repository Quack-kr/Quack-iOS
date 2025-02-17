//
//  RestaurantDetailBottomSheet.swift
//  Quack
//
//  Created by 차차 on 2/10/25.
//

import SwiftUI

struct RestaurantDetailBottomSheet: View {
    let buttonLabel = ["꽉 찬 리뷰 쓰기", "간편하게 리뷰 쓰기"];
    let buttonDescription = ["이곳의 모든 것을 알고 있는 사람을 위해", "사진도 귀찮고 글도 쓰기 귀찮다"];
    var body: some View {
        VStack(alignment: .leading) {
            Text("리뷰 작성")
            
            ForEach(0..<2) { ind in
                Button(action: {}) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(buttonLabel[ind])
                            Text(buttonDescription[ind])
                        }
                        
                        Spacer()
                        
                        Image(.chevronRight)
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantDetailBottomSheet()
}
