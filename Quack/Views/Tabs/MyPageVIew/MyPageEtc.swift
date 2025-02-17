//
//  MyPageEtc.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct MyPageEtc: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("기타")
                .textModifier(.theJamsil, 700, 18, "#EFEEDF")
            
            Button(action: {}) {
                HStack {
                    //TODO: 이미지 추가
                    Image(.policy)
                    
                    Text("약관 및 정책")
                    
                    Spacer()
                    
                    Image(.chevronRight)
                }
            }
            
            Button(action: {}) {
                HStack {
                    Image(.notice)
                    
                    Text("공지사항")
                    
                    Spacer()
                    
                    Image(.chevronRight)
                }
            }
            
            HStack {
                Image(.notice)
                
                //TODO: 버전 동적으로 변경
                Text("버전 정보 1.0.0")
                
                Spacer()
            }
        }
        .textModifier(.pretendard, 400, 16, "#EFEEDF")
    }
}

#Preview {
    MyPageEtc()
        .background(Color.background)
}
