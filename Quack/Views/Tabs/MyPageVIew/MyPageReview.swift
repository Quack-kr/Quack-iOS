//
//  MyPageReview.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct MyPageReview: View {
    let buttonLabel = ["리뷰 관리", "저장함"]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                ForEach(buttonLabel, id:\.self) { label in
                    Button(action:{
                        
                    }) {
                        VStack(alignment: .leading, spacing: 22) {
                            Text(label)
                                .textModifier(.theJamsil, 700, 16, "#EFEEDF")
                            
                            HStack {
                                Text("0")
                                    .textModifier(.pretendard, 700, 20, "#EFEEDF")
                                
                                Spacer()
                                
                                Image(.chevronRight)
                            }
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color(hex:"#21211D"))
                        )
                    }
                }
            }
            
            Button(action:{}){
                HStack {
                    Image(.review)
                        .frame(width: 16)
                    
                    Text("리뷰쓰고 데시벨 올리기")
                }
                .textModifier(.pretendard, 700, 16, "#EFEEDF")
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 78)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(Color(hex:"#323230"))
                )
            }
        }
    }
}

#Preview {
    MyPageReview()
        .background(Color.background)
}
