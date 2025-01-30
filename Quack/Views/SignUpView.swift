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
    @State private var isNicknameProper = true;
    @State private var nicknameInstructionText = NicknameInstructionText()
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                    Text("이것만 하면 회원가입 끝!")
                        .font(.pretendard(.number(800), size: 24))
                        .foregroundStyle(Color(hex:"#EFEEDF"))

                    Text("꽥을 이용할 마지막 단계!")
                        .font(.pretendard(.number(400), size: 16))
                        .foregroundStyle(Color(hex: "#A8A7A1"))
            }
            .padding(.top, 80)
            
            Spacer()
            
            VStack(spacing: 24) { // content Stack
                VStack(alignment: .leading, spacing: 8){
                    HStack {
                        Text("닉네임")
                            .font(.theJamsil(.number(700), size: 14))
                            .foregroundStyle(Color(hex:"#A8A7A1"))
                        
                        Spacer()
                        
                        Text("\(nickname.count)/20")
                            .font(.pretendard(.number(500), size: 14))
                            .foregroundStyle(Color(hex:"#A8A7A1"))
                        
                    }
                    ZStack {
                        TextField("닉네임을 입력하세요.", text: $nickname)
                            .padding(.leading, 16)
                            .font(.pretendard(.number(700), size: 16))
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                            .onChange(of: nickname.count) {
                                
                                if (nickname.count < 3) {
                                    if isNicknameProper {
                                        nicknameInstructionText = .short
                                        isNicknameProper.toggle()
                                    }
                                }
                                else if  (nickname.count > 20) {
                                    if isNicknameProper {
                                        nicknameInstructionText = .long
                                        isNicknameProper.toggle()
                                    }
                                }
                                else {
                                    if !isNicknameProper {
                                        nicknameInstructionText = .normal
                                        isNicknameProper.toggle()
                                    }
                                }
                            }

                    }
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color(hex:"#323230"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.red, lineWidth: 1)
                                    .opacity(isNicknameProper ? 0 : 1)
                            )
                    )
                    
                    Text(nicknameInstructionText.rawValue)
                        .font(.pretendard(.number(400), size: 12))
                        .foregroundStyle(isNicknameProper ? .point : .red)
                        .padding(.leading, 16)
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("이메일")
                            .font(.theJamsil(.number(700),size: 14))
                            .foregroundStyle(Color(hex:"#A8A7A1"))
                        
                        Spacer()
                    }
                    ZStack {
                        HStack {
                            // TODO: 서버로부터 전송받은 이메일로 변경
                            Text("papa021326@naver.com")
                                .padding(.leading, 16)
                                .font(.pretendard(.number(700), size: 16))
                                .tint(Color(hex:"#525250"))
                            
                            Spacer()
                        }
                        .foregroundStyle(Color(hex:"#525250"))
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color(hex:"#323230"))
                        )
                    }
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color(hex:"#323230"))
                    )
                    
                    Text("\(SocialMedia().rawValue)로 가입한 계정이에요.")
                        .font(.theJamsil(.number(400), size: 12))
                        .foregroundStyle(Color(hex:"#A8A7A1"))
                        .padding(.leading, 16)
                }
            }
            
            Spacer()
            Spacer()
            
            Button(action: {
                coordinator.push(.tabBarView)
            }){
                    Text("시작하기")
                    .frame(maxWidth: .infinity)
                    .font(.pretendard(.number(700), size: 16))
                    .foregroundStyle(Color(hex:"#171714"))
                    .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(isNicknameProper ? .point : Color(hex: "#525250"))
                        )

            }
            .disabled(isNicknameProper ? false : true)

        }
        .padding(.horizontal, 16)
    }
    
    func checkNickname() -> Bool {
        if (nickname.count < 3 || nickname.count > 20) {
            return false
        }
        //TODO: 닉네임 중복 확인
//        else if (true) {
//            return false
//        }
        
        return true;
    }
}

#Preview {
    SignUpView()
        .background(Color.background)
}
