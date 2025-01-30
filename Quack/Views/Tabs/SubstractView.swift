//
//  SubstractView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct SubstractView: View {
    @State private var isSheetPresented = false;
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                VStack(spacing: 24) {
                    /** Substract Header */
                    HStack(spacing: 16) {
                        Text("뺴기")
                            .font(.theJamsil(.number(700), size: 20))
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                        
                        Spacer()
                        
                        Button(action:{}){
                            Image(.search)
                        }
                        
                        Button(action:{}){
                            Image(.notify)
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    /** Substract  Filter  */
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            Button(action: {
                                isSheetPresented.toggle()
                            }) {
                                HStack {
                                    Text("동네설정")
                                        .font(.theJamsil(.number(700), size: 14))
                                        .foregroundStyle(Color(hex: "#EFEEDF"))
                                    
                                    Image(.chevronDown)
                                        .frame(height: 12)
                                }
                                .padding(.leading, 12)
                                .padding(.trailing, 10.5)
                                .padding(.vertical, 8)
                                .background(
                                    Rectangle()
                                        .cornerRadius(10)
                                        .foregroundStyle(Color(hex:"#2A2925"))
                                    
                                )
                            }
                            
                            HStack(spacing: 8) {
                                Button(action: {}) {
                                    Image(.menu)
                                        .frame(height: 19)
                                        .padding(.leading, 12)
                                        .padding(.trailing, 10.5)
                                        .padding(.vertical, 8)
                                        .background(
                                            Rectangle()
                                                .cornerRadius(10)
                                                .foregroundStyle(Color(hex:"#2A2925"))
                                            
                                        )
                                }
                                
                                Button(action: {}) {
                                    Text("메뉴")
                                        .font(.theJamsil(.number(700), size: 14))
                                        .foregroundStyle(Color(hex:"#EFEEDF"))
                                        .padding(.leading, 12)
                                        .padding(.trailing, 10.5)
                                        .padding(.vertical, 8)
                                        .background(
                                            Rectangle()
                                                .cornerRadius(10)
                                                .foregroundStyle(Color(hex:"#2A2925"))
                                            
                                        )
                                }
                                
                                /*
                                 Button(action: {}) {
                                 Text("주차")
                                 .font(.theJamsil(.number(700), size: 14))
                                 .foregroundStyle(Color(hex:"#EFEEDF"))
                                 .padding(.leading, 12)
                                 .padding(.trailing, 10.5)
                                 .padding(.vertical, 8)
                                 .background(
                                 Rectangle()
                                 .cornerRadius(10)
                                 .foregroundStyle(Color(hex:"#2A2925"))
                                 
                                 )
                                 }
                                 
                                 Button(action: {}) {
                                 Text("분위기")
                                 .font(.theJamsil(.number(700), size: 14))
                                 .foregroundStyle(Color(hex:"#EFEEDF"))
                                 .padding(.leading, 12)
                                 .padding(.trailing, 10.5)
                                 .padding(.vertical, 8)
                                 .background(
                                 Rectangle()
                                 .cornerRadius(10)
                                 .foregroundStyle(Color(hex:"#2A2925"))
                                 
                                 )
                                 }
                                 
                                 Button(action: {}) {
                                 Text("서비스")
                                 .font(.theJamsil(.number(700), size: 14))
                                 .foregroundStyle(Color(hex:"#EFEEDF"))
                                 .padding(.leading, 12)
                                 .padding(.trailing, 10.5)
                                 .padding(.vertical, 8)
                                 .background(
                                 Rectangle()
                                 .cornerRadius(10)
                                 .foregroundStyle(Color(hex:"#2A2925"))
                                 
                                 )
                                 }
                                 
                                 Button(action: {}) {
                                 Text("기타")
                                 .font(.theJamsil(.number(700), size: 14))
                                 .foregroundStyle(Color(hex:"#EFEEDF"))
                                 .padding(.leading, 12)
                                 .padding(.trailing, 10.5)
                                 .padding(.vertical, 8)
                                 .background(
                                 Rectangle()
                                 .cornerRadius(10)
                                 .foregroundStyle(Color(hex:"#2A2925"))
                                 
                                 )
                                 }
                                 */
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.vertical, 9)
                    .padding(.leading, 16)
                }
                .padding(.top, 70)
                .background(
                    Rectangle()
                        .foregroundStyle(Color(hex:"#171714"))
                )
                
                
                VStack(spacing: 24) {
                    HStack(alignment: .bottom) {
                        Text(
                        """
                        싫어하는 걸
                        싹 빼고
                        시작하자.
                        """
                        )
                        .font(.theJamsil(.number(700), size: 40))
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                        
                        Text(
                        """
                        꽥은 당신이
                        뭘 먹고 싶은지
                        묻지 않아요
                        """
                        )
                        .font(.pretendard(.number(700), size: 22))
                        .foregroundStyle(Color(hex:"#323230"))
                        .multilineTextAlignment(.trailing)
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Button(action: {}) {
                                VStack {
                                    Image(.chicken)
                                        .frame(height: 36)
                                        .padding(9)
                                        .background(
                                            Circle()
                                                .foregroundStyle(Color(hex:"#2A2925"))
                                            
                                        )
                                    
                                    Text("치킨")
                                        .font(.pretendard(.number(600), size: 12))
                                        .foregroundStyle(Color(hex:"#EFEEDF"))
                                }
                            }
                        }
                        .padding(.leading, 16)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.bottom, 16)
                }
                .background(
                    Rectangle()
                        .foregroundStyle(Color(hex:"#171714"))
                        .ignoresSafeArea(edges: .top)
                )
                
                VStack(spacing: 24) {
                    HStack {
                        Text("점심에 고기는 헤비해!") // TODO: 문장 동적 변경
                            .font(.theJamsil(.number(700), size: 18))
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                        
                        Spacer()
                        HStack(spacing: 8) {
                            Button(action: {}) {
                                Text("영업중")
                                    .font(.theJamsil(.number(700), size: 12))
                                    .foregroundStyle(Color(hex:"#A8A7A1"))
                                    .padding(.leading, 12)
                                    .padding(.trailing, 10.5)
                                    .padding(.vertical, 8)
                                    .background(
                                        Rectangle()
                                            .cornerRadius(15)
                                            .foregroundStyle(Color(hex:"#2A2925"))
                                        
                                    )
                                
                            }
                            
                            Button(action: {}) {
                                HStack {
                                    Text("거리순")
                                        .font(.theJamsil(.number(700), size: 12))
                                    
                                    Image(.chevronDown)
                                }
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                                .padding(.leading, 12)
                                .padding(.trailing, 10.5)
                                .padding(.vertical, 8)
                                .background(
                                    Rectangle()
                                        .cornerRadius(15)
                                        .foregroundStyle(Color(hex:"#2A2925"))
                                    
                                )
                            }
                        }
                    }
                    .padding(.top, 24)
                    
                    VStack {
                        HStack {
                            Image(.dummyThumbnail)
                            
                            VStack {
                                Image(.dummyMenu)
                                
                                Image(.dummyMenu)
                            }
                            
                        }
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("김밥천국 분식") // TODO: 카테고리 색상 변경
                                    .font(.pretendard(.number(600), size: 16))
                                
                                Text("1인 오너 쉐프가 운영하는 합리적인 가격의 가게")
                                    .font(.pretendard(.number(500), size: 12))
                                
                                Text("816m | 평균 8,000원 | 영업시간 10:00 ~ 23:00") // TODO: 거리 색상 변경
                                    .font(.pretendard(.number(400), size: 14))
                            }
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            Spacer()
                            
                            Image(.book)
                        }
                        
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .background(
                    Rectangle()
                        .foregroundStyle(Color(hex:"#171714"))
                        .ignoresSafeArea(edges: .top)
                )
                
                Spacer()
            }
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    SubstractView()
        .background(Color.background)
}
