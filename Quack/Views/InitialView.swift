//
//  InitialView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI
import KakaoSDKUser

struct InitialView: View {
    @State private var isSheetPresented = false;
    @State private var isAllPolicyButtonsSelected = false;
    @State private var policyButtonColor = [Color](repeating: Color(hex:"#EFEEDF"), count: 4)
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    @EnvironmentObject var user: User
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.logoWithText)
                .renderingMode(.template)
                .foregroundStyle(Color(hex:"#EFEEDF"))
            
            Spacer()
            
            VStack(spacing: 10) {
                Button(action: {
                    user.socialLoginType = .kakao
                    isSheetPresented.toggle()
                }){
                    // TODO: 카카오 로그인 디자인 가이드 확인
                    HStack {
                        Spacer()
                        
                        Image(systemName: "message.fill")
                        
                        Text("카카오로 계속하기")
                            .font(.pretendard(.number(700), size: 14))
                        
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .background(
                        Rectangle()
                            .cornerRadius(12)
                            .foregroundStyle(.point)
                    )
                    .foregroundStyle(Color(hex: "#171714"))
                }
                
                
                Button(action: {
                    
                }){
                    HStack {
                        Spacer()
                        
                        Text("추후 업데이트 예정")
                            .font(.theJamsil(.number(700), size: 14))
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.white.opacity(0.2))
                    )
                }
                .disabled(true)
                .opacity(0.5)
                
                Button(action: {
                    
                }){
                    HStack {
                        Spacer()
                        
                        Text("추후 업데이트 예정")
                            .font(.theJamsil(.number(700), size: 14))
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.white.opacity(0.2))
                    )
                }
                .disabled(true)
                .opacity(0.5)
                
                
                Button(action : {
                    coordinator.push(.tabBarView)
                }) {
                    Text("둘러보기")
                        .font(.pretendard(.number(500), size: 14))
                        .foregroundStyle(Color(hex:"#A8A7A1"))
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 29)
        .sheet(isPresented: $isSheetPresented, content: {
            VStack {
                // TODO: sheet close 기능 구현하기? -> 현재 전체 화면에 다 적용되어 있음
                Capsule()
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                    .frame(width: 40, height: 4)
                    .padding(.top, 16)
                
                Spacer()
                
                Text("약관동의")
                    .padding(.bottom, 16)
                    .font(.pretendard(.number(800), size: 18))
                    .foregroundStyle(Color(hex:"#EFEEDF"))
                
                VStack {
                    VStack(spacing: 16) {
                        Button(action: {
                            isAllPolicyButtonsSelected = true
                            
                            for ind in policyButtonColor.indices {
                                policyButtonColor[ind] = Color(.point)
                            }
                        }) {
                            HStack {
                                Image(.checkCircle)
                                    .renderingMode(.template)
                                    .font(.system(size: 24))
                                
                                Text("이용약관 모두 동의")
                                    .font(.pretendard(.number(500), size: 14))
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                            .padding(.vertical, 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 110)
                                    .stroke(isAllPolicyButtonsSelected ? Color.point : Color(hex:"#EFEEDF"), lineWidth: 1)
                            )
                        }
                        .foregroundStyle(isAllPolicyButtonsSelected ? Color.point : Color(hex:"#EFEEDF"))
                        
                        VStack(spacing: 24) {
                            ForEach(policyButtonColor.indices, id: \.self) { index in
                                Button(action: {
                                    if policyButtonColor[index] == Color(hex:"#EFEEDF") {
                                        policyButtonColor[index] = Color(.point)
                                    }
                                    else {
                                        policyButtonColor[index] = Color(hex:"#EFEEDF")
                                    }
                                    if policyButtonColor.allSatisfy({ $0 == Color.point }) {
                                        isAllPolicyButtonsSelected.toggle()
                                    } else {
                                        if isAllPolicyButtonsSelected {
                                            isAllPolicyButtonsSelected.toggle()
                                        }
                                    }
                                }) {
                                    HStack {
                                        Image(.checkCircle)
                                            .renderingMode(.template)
                                        
                                        Text(policyTitle[index])
                                            .font(.pretendard(.number(500), size: 14))
                                        
                                        Spacer()
                                        
                                        Image(.chevronRight)
                                            .renderingMode(.template)
                                    }
                                    .foregroundStyle(policyButtonColor[index])
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 8)
                        
                    }
                }
                .padding(.horizontal, 24)
                
                Text(
                     """
                     \'선택\' 항목에 동의하지 않아도 서비스 이용이 가능합니다.
                     개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며,
                     동의 거부시 서비스 이용이 제한됩니다.
                     """
                )
                .font(.pretendard(.number(400), size: 10))
                .foregroundStyle(Color(hex:"#A8A7A1"))
                .multilineTextAlignment(.center)
                //                .padding(.horizontal, 72)
                
                Spacer()
                
                Button(action: {
                    // 카카오톡 실행 가능 여부 확인 TODO: 소셜 로그인 별 로직 분리
//                    if (UserApi.isKakaoTalkLoginAvailable()) {
//                        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                            if let error = error {
//                                print(error)
//                            }
//                            else {
//                                print("loginWithKakaoTalk() success.")
//                                _ = oauthToken
//                                
//                                isSheetPresented.toggle() //TODO: dismiss() 사용시 왜 error?
//                                coordinator.push(.signUpView)
//                            }
//                        }
//                    }
                    
                    isSheetPresented.toggle() //TODO: dismiss() 사용시 왜 error?
                    coordinator.push(.signUpView)
                }){
                    Text("다음으로")
                        .frame(maxWidth: .infinity)
                        .font(.pretendard(.number(700), size: 16))
                        .foregroundStyle(Color(hex:"#171714"))
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(isAllPolicyButtonsSelected ? .point : Color(hex: "#525250"))
                        )
                }
                .disabled(isAllPolicyButtonsSelected ? false : true)
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity)
            .presentationDetents([.fraction(0.67)])
            .presentationBackground(Color(hex:"#323230"))
        })
    }
}

#Preview {
    InitialView()
        .background(Color.background)
}
