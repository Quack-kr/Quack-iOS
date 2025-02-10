//
//  Reviews.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct Reviews: View {
    let reviews: [Review]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("별점 없는 리뷰 \(reviews.count)")
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                
                Spacer()
                
                HStack {
                     Image(.checkBox)
                    
                    Text("사진있는 리뷰만")
                }
                .textModifier(.theJamsil, 700, 14, "#A8A7A1")
            }
            .padding(.bottom, 24)
            
            VStack(spacing: 0) {
                ForEach(reviews, id: \.self) { review in
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                             Image(.profile)
                                .background(
                                    Circle()
                                        .foregroundStyle(Color(hex:"#323230"))
                                )
                            
                            Text(review.userName)
                                .textModifier(.pretendard, 700, 12, "#A8A7A1")
                            
                            Text(review.date)
                                .textModifier(.pretendard, 500, 12, "#A8A7A1")
                            
                            Spacer()
                        }
                        .padding(.bottom, 8)
                        
                        HStack(spacing: 14) {
                            Image(.dummyMenu)
                            
                            Text(review.content)
                                .textModifier(.pretendard, 400, 14, "#A8A7A1")
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                        ForEach(0 ..< 2) { _ in
                            HStack(spacing: 8) {
                                Circle()
                                    .frame(width: 14)
                                    .foregroundStyle(Color(hex:"#21211D"))
                                
                                Text("자루우동 미친맛")
                                    .textModifier(.theJamsil, 700, 12, "#EFEEDF")
                            }
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color(hex:"#323230"))
                            )
                            }
                            
                            Text("+3")
                                .textModifier(.theJamsil, 700, 12, "#EFEEDF")
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(Color(hex:"#323230"))
                                )
                            
                            Spacer()
                        }
                        .padding(.bottom, 24)
                    }
                }
            }
            
            
            Button(action: {}) {
                Text("후기 다보기")
                    .frame(maxWidth: .infinity)
                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(hex:"#EFEEDF"), lineWidth: 1)
                    )
            }
            .padding(.trailing, 16)
            
            
        }
        .padding(.horizontal, 16)
        .restaurantDetailComponentBackgroundModifier()
    }
}

#Preview {
    Reviews(reviews: [Review](repeating: Review(userName: "금손 언데드 001", date: "2024.04.10", thumbnail: "", content: "자루우동은 진짜 맛있는데 니꾸우동은 그냥 먹어줄만 했어요..."), count: 10))
}
