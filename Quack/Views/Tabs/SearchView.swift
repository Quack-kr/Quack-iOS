//
//  SearchView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = "";
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                /* Search Bar */
                HStack {
                    Image(.chevronLeft)
                    
                    HStack {
                        TextField(
                            "",
                            text: $searchText,
                            prompt: Text("장소, 가게 두드려보GO")
                                .foregroundStyle(Color(hex:"#68675E"))
                        )
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                        .tint(.point)
                        
                        Button(action: {}) {
                            Image(.search)
                                .frame(height: 18)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(Color(hex:"#323230"))
                    )
                }
                
                /* Recently Searched Text*/
                VStack(spacing: 14) {
                    HStack {
                        Text("최근 검색어")
                            .font(.theJamsil(.number(700), size: 14))
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                        
                        Spacer()
                        
                        Text("지우기")
                            .font(.pretendard(.number(600), size: 12))
                            .foregroundStyle(Color(hex:"#D7D5C1"))
                            .onTapGesture {
                                // TODO: 전체 지우기 기능 추가
                            }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 4) {
                            HStack {
                                Text("고기")
                                    .font(.theJamsil(.number(700), size: 14))
                                    .foregroundStyle(Color(hex:"#D7D5C1"))
                                
                                Image(.erase)
                                    .onTapGesture {
                                        // TODO: 개별 지우기 기능 추가
                                    }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color(hex:"#2A2925"))
                            )
                        }
                    }
                }
                
                /* Recently Searched Location */
                VStack(spacing: 14) {
                    HStack {
                        Text("최근 검색 장소")
                            .font(.theJamsil(.number(700), size: 14))
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                        
                        Spacer()
                        
                        Text("지우기")
                            .font(.pretendard(.number(600), size: 12))
                            .foregroundStyle(Color(hex:"#D7D5C1"))
                            .onTapGesture {
                                // TODO: 지우기 기능 추가
                            }
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing: 14) {
                            VStack(spacing: 8) {
                                Image(.dummyMenu)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:64)
                                
                                Text("김밥천국")
                                    .font(.pretendard(.number(600), size: 12))
                                    .foregroundStyle(Color(hex:"#D7D5C1"))
                            }
                        }
                    }
                }
                
                
                /* Live Search Ranking */
                VStack(alignment: .leading, spacing: 20) {
                    Text("실시간 검색 순위")
                        .font(.theJamsil(.number(700), size: 14))
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                    
                    VStack(spacing: 16) {
                        HStack(alignment: .center, spacing: 16) {
                            ZStack(alignment:.top) {
                                Image(.dummyMenu)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 64)
                                
                                VStack(alignment: .leading) {
                                    Spacer()
                                    
                                    HStack {
                                        Text("1")
                                            .font(.theJamsil(.number(700), size: 30))
                                            .foregroundStyle(Color(hex:"#EFEEDF"))
                                        
                                        Spacer()
                                    }
                                }
                                .frame(width:88, height: 71)
                            }
                            
                            VStack(alignment:.leading, spacing: 4) {
                                HStack {
                                    Text("고기천국")
                                        .font(.pretendard(.number(600), size: 16))
                                        .foregroundStyle(Color(hex:"#D7D5C1"))
                                    
                                    Text("분식")
                                    
                                }
                                Text("1인 오너 쉐프가 운영하는 합리적인 가격의 가게")
                                
                                Text("816m | 평균 8,000원 | 영업중")

                            }
                            .foregroundStyle(Color(hex:"#A8A7A1"))
                            .font(.pretendard(.number(500), size: 12))
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    SearchView()
        .background(Color.background)
}
