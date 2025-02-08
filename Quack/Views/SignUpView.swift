//
//  SignUpView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI
import KakaoSDKUser

struct SignUpView: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @EnvironmentObject var user: User
    @State private var nickname = "붉은 탕수육 0001"; // TODO: 서버로부터 생성받은 닉네임으로 초기 설정
    @State private var isNicknameProper = true;
    @State private var nicknameInstructionText = NicknameInstructionText()
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("이것만 하면 회원가입 끝!")
                    .textModifier(.pretendard, 800, 24, "#EFEEDF")
                
                Text("꽥을 이용할 마지막 단계!")
                    .textModifier(.pretendard, 400, 16, "#A8A7A1")
            }
            .padding(.top, 80)
            
            Spacer()
            
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 8){
                    HStack {
                        Text("닉네임")
                            .textModifier(.theJamsil, 700, 14, "#A8A7A1")
                        
                        Spacer()
                        
                        Text("\(nickname.count)/20")
                            .textModifier(.pretendard, 500, 14, "#A8A7A1")
                    }
                    ZStack {
                        TextField("닉네임을 입력하세요.", text: $nickname)
                            .padding(.leading, 16)
                            .textModifier(.pretendard, 700, 16, "#EFEEDF")
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
                        .textModifier(.pretendard, 400, 12, isNicknameProper ? .point : .red)
                        .padding(.leading, 16)
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("이메일")
                            .textModifier(.theJamsil, 700, 14, "#A8A7A1")
                        
                        Spacer()
                    }
                    ZStack {
                        HStack {
                            // TODO: 서버로부터 전송받은 이메일로 변경
                            Text("papa021326@naver.com")
                                .padding(.leading, 16)
                                .textModifier(.pretendard, 700, 16, "#525250")
                            
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
                    
                    Text("\(user.socialLoginType.rawValue)로 가입한 계정이에요.")
                        .textModifier(.theJamsil, 400, 12, "#A8A7A1")
                        .padding(.leading, 16)
                }
            }
            
            Spacer()
            Spacer()
            
            Button(action: {
                // 디버깅용 카카오 로그인 unlink 코드
                UserApi.shared.unlink {(error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("unlink() success.")
                    }
                }
                
                user.isLogIn = true
                coordinator.push(.tabBarView)
            }){
                Text("시작하기")
                    .blockableButtonTextModifier($isNicknameProper)                
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
        .environmentObject(User())
}
