//
//  ReviewView.swift
//  Quack
//
//  Created by 차차 on 2/10/25.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        VStack {
            HStack {
                
                VStack(alignment: .leading) {
                    Text("소문난 성수 감자탕")
                    Text("일식 | 서울 성동구 성덕정17길 11 2층")
                }
            }
            
            Text("어떤 메뉴를 도전하셨나요?")
            
            ForEach(0..<2) { _ in
                Text("우동")
                ForEach(0..<5) { _ in
                    HStack {
                        
                        VStack {
                            
                        }
                        
                        Spacer()
                        
                        Image(.checkCircle)
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewView()
}
