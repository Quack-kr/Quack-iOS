//
//  MyView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct MyView: View {
    @State private var hackGongGam:Double = 0.2
    
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text("마이페이지")
                    .font(.theJamsil(.number(700), size: 20))
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                
                Spacer()
                
                Image(.setting)
            }
            .padding(.bottom, 12)
            
            HStack {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("로그인/회원가입")
                        .font(.theJamsil(.number(700), size: 18))
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                    
                    
                    Text("5초만에 로그인하고 꽥을 누려보세요!")
                        .font(.pretendard(.number(600), size: 14))
                        .foregroundStyle(Color(hex:"#68675E"))
                })
                
                Spacer()
                
                Image(.chevronRight)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                //TODO: 숫자 부분 weight 변경
                Text("핵공감 데시벨 0dB")
                    .font(.pretendard(.number(400),size: 14))
                    .foregroundStyle(.point)
                
                // TODO: Progress Bar
                    ProgressView(value: hackGongGam)
                        .accentColor(.point)
                        .controlSize(.regular)
            }
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    Button(action:{
                        
                    }) {
                        VStack(alignment: .leading, spacing: 22) {
                            Text("리뷰 관리")
                                .font(.theJamsil(.number(700), size: 16))
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            HStack {
                                Text("0")
                                    .font(.pretendard(.number(700), size: 20))
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                
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
                    
                    Button(action:{
                        
                    }) {
                        VStack(alignment: .leading, spacing: 22) {
                            Text("저장함")
                                .font(.theJamsil(.number(700), size: 16))
                                .foregroundStyle(Color(hex:"#EFEEDF"))
                            
                            HStack {
                                Text("0")
                                    .font(.pretendard(.number(700), size: 20))
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                
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
                
                Button(action:{}){
                    HStack {
                        Image(.review)
                            .frame(width: 16)
                        
                        Text("리뷰쓰고 데시벨 올리기")
                            .font(.pretendard(.number(700), size: 16))
                    }
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                    .padding(.horizontal, 78)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color(hex:"#323230"))
                    )
                }
            }
            
            VStack(alignment: .leading, spacing: 24) {
                Text("고객센터")
                    .font(.theJamsil(.number(700), size: 18))
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                
                HStack {
                    Image(.inquiry)
                    
                    Text("1:1 문의하기")
                        .font(.pretendard(.number(400), size: 16))
                    
                    Spacer()
                    
                    Image(.chevronRight)
                }
                
            }
            .foregroundStyle(Color(hex:"#EFEEDF"))
            .padding(.vertical, 8)
            
            VStack(alignment: .leading, spacing: 24) {
                Text("기타")
                    .font(.theJamsil(.number(700), size: 18))
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                
                HStack {
                    //TODO: 이미지 추가
                    Image(.policy)
                    
                    Text("약관 및 정책")
                        .font(.pretendard(.number(400), size: 16))
                    
                    Spacer()
                    
                    Image(.chevronRight)
                }
                
                HStack {
                    Image(.notice)
                    
                    Text("공지사항")
                        .font(.pretendard(.number(400), size: 16))
                    
                    Spacer()
                    
                    Image(.chevronRight)
                }
                
                HStack {
                    Image(.notice)
                    
                    //TODO: 버전 동적으로 변경
                    Text("버전 정보 1.0.0")
                        .font(.pretendard(.number(400), size: 16))
                    
                    Spacer()
                }
            }
            .foregroundStyle(Color(hex:"#EFEEDF"))
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    MyView()
        .background(Color.background)
}
