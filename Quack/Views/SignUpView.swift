//
//  SignUpView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    // TODO: 서버로부터 생성받은 닉네임으로 초기 설정
    @State private var nickname = "붉은 탕수육 0001";
    @State private var nickname_len = 0;
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("이것만 하면 회원가입 끝!")
                        .font(.pretendard(.number(800)))
                        .foregroundStyle(Color(hex:"#EFEEDF"))

                    Spacer()
                }
                HStack {
                    Text("꽥을 이용할 마지막 단계!")
                        .font(.pretendard(.number(400)))
                        .foregroundStyle(Color(hex: "#A8A7A1"))
                    Spacer()
                }
            }
            .padding(.top, 80)
            
            Spacer()
            
            VStack(spacing: 24) { // content Stack
                VStack(alignment: .leading){
                    HStack {
                        Text("닉네임")
                            .font(.theJamsil(.number(700)))
                            .foregroundStyle(Color(hex:"#A8A7A1"))
                        
                        Spacer()
                        
                        Text("\(nickname_len)/20")
                            .font(.pretendard(.number(500)))
                            .foregroundStyle(Color(hex:"#A8A7A1"))
                        
                    }
                    ZStack {
                        TextField("닉네임을 입력하세요.", text: $nickname)
                            .padding(.leading, 16)
                            .font(.pretendard(.number(700)))
                            .foregroundStyle(Color(hex:"#EFEEDF"))

                    }
                    .frame(height: 53)
                    .cornerRadius(8)
                    .foregroundStyle(Color(hex:"#323230"))
                    
                    Text("꽥에서 사용하실 이름이에요.")
                        .font(.pretendard(.number(400)))
                        .foregroundStyle(.point)
                        .padding(.leading, 16)
                }
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("이메일")
                            .font(.theJamsil(.number(700)))
                            .foregroundStyle(Color(hex:"#A8A7A1"))
                        
                        Spacer()
                    }
                    ZStack {
                        HStack {
                            // TODO: 서버로부터 전송받은 이메일로 변경
                            Text("papa021326@naver.com")
                                .padding(.leading, 16)
                                .font(.pretendard(.number(700)))
                                .foregroundStyle(Color(hex:"#525250"))
                            
                            Spacer()
                        }
                    }
                    .frame(height: 53)
                    .cornerRadius(8)
                    
                    // TODO: InitialView로부터 소셜 로그인 방식 넘겨받기
                    Text("카카오로 가입한 계정이에요.")
                        .font(.theJamsil(.number(400)))
                        .foregroundStyle(Color(hex:"#A8A7A1"))
                        .padding(.leading, 16)
                }
            }
            .frame(width: 343)
            
            Spacer()
            Spacer()
            
            Button(action: {
                coordinator.push(.tabBarView)
            }){
                ZStack {
                    Rectangle()
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                    
                    Text("시작하기")
                        .font(.pretendard(.number(700)))
                        .foregroundStyle(Color(hex:"#171714"))
                }
                .foregroundStyle(.point)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SignUpView()
        .background(Color.background)
}
