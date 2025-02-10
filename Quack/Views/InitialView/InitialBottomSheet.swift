//
//  InitialBottomSheet.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI
import KakaoSDKUser

struct InitialBottomSheet: View {
    @Binding var isEveryRequiredSelected:Bool
    @Binding var isSheetPresented:Bool
    @Binding  var policyButtonColor : [Color]
    @EnvironmentObject private var coordinator: Coordinator<Destination>
    
    var body: some View {
        VStack {
            // TODO: sheet close 기능 구현하기 -> 현재 전체 화면에 다 적용되어 있음
            Capsule()
                .foregroundStyle(Color(hex:"#EFEEDF"))
                .frame(width: 40, height: 4)
                .padding(.top, 16)
            
            Spacer()
            
            Text("약관동의")
                .padding(.bottom, 16)
                .textModifier(.pretendard, 800, 18, "#EFEEDF")
            
            VStack {
                VStack(spacing: 16) {
                    Button(action: {
                        isEveryRequiredSelected = true
                        
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
                                .stroke(isEveryRequiredSelected ? Color.point : Color(hex:"#EFEEDF"), lineWidth: 1)
                        )
                    }
                    .foregroundStyle(isEveryRequiredSelected ? Color.point : Color(hex:"#EFEEDF"))
                    
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
                                    isEveryRequiredSelected.toggle()
                                } else {
                                    if isEveryRequiredSelected {
                                        isEveryRequiredSelected.toggle()
                                    }
                                }
                            }) {
                                HStack {
                                    Image(.checkCircle)
                                        .renderingMode(.template)
                                    
                                    Text(POLICY_TITLE[index])
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
            
            Text(POLICY_NOTICE)
                .textModifier(.pretendard, 400, 10, "#A8A7A1")
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: {
                // 카카오톡 실행 가능 여부 확인 TODO: 소셜 로그인 별 로직 분리
                    if (UserApi.isKakaoTalkLoginAvailable()) {
                        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                print("loginWithKakaoTalk() success.")
                                _ = oauthToken
                                print("토큰 : \(oauthToken?.accessToken)")

                                isSheetPresented.toggle() //TODO: dismiss() 사용시 왜 error?
                                coordinator.push(.signUpView)
                            }
                        }
                    }
                
                isSheetPresented.toggle() //TODO: dismiss() 사용시 왜 error?
                coordinator.push(.signUpView)
            }){
                Text("다음으로")
                    .blockableButtonTextModifier($isEveryRequiredSelected)
            }
            .disabled(isEveryRequiredSelected ? false : true)
            .tint(isEveryRequiredSelected ? .clear : Color(hex:"#525250"))
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
        .presentationDetents([.fraction(0.67)])
        .presentationBackground(Color(hex:"#323230"))
    }
}

#Preview {
    InitialBottomSheet(isEveryRequiredSelected: .constant(false), isSheetPresented: .constant(false), policyButtonColor: .constant([Color](repeating: Color(hex:"#EFEEDF"), count: 4)))
        .background(Color.background)
}
