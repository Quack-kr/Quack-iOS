//
//  InitialBottomSheet.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI
import KakaoSDKUser

struct InitialBottomSheet: View {
    @State private var isAllSelected = false
    @State private var policyButtons  = (0..<4).map { index in
        PolicyButton(title: PolicyTitle[index], isChecked: false)
    }
    @Binding var isSheetPresented: Bool

    @EnvironmentObject private var coordinator: Coordinator<Destination>

    var body: some View {
        VStack {
            // TODO: sheet close 기능 구현하기 -> 현재 전체 화면에 다 적용되어 있음
            Capsule()
                .foregroundStyle(Color(hex: "#EFEEDF"))
                .frame(width: 40, height: 4)
                .padding(.top, 16)

            Spacer()

            Text("약관동의")
                .padding(.bottom, 16)
                .textModifier(.pretendard, 800, 18, "#EFEEDF")

            VStack {
                VStack(spacing: 16) {
                    Button(action: {
                        for ind in policyButtons.indices {
                            policyButtons[ind].isChecked = true
                        }

                        isAllSelected = true
                    }, label: {
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
                                .stroke(isAllSelected ? Color.point : Color(hex: "#EFEEDF"), lineWidth: 1)
                        )
                    })
                    .foregroundStyle(isAllSelected ? Color.point : Color(hex: "#EFEEDF"))

                    VStack(spacing: 24) {
                        ForEach(policyButtons.indices, id: \.self) { index in
                            Button(action: {
                                policyButtons[index].isChecked.toggle()

                                let primaryPolicyButtons = policyButtons.dropLast()
                                if primaryPolicyButtons.allSatisfy({ $0.isChecked == true }) {
                                    isAllSelected = true
                                } else {
                                    if isAllSelected {
                                        isAllSelected.toggle()
                                    }
                                }
                            }, label: {
                                HStack {
                                    Image(.checkCircle)
                                        .renderingMode(.template)

                                    Text(policyButtons[index].title)
                                        .font(.pretendard(.number(500), size: 14))

                                    Spacer()

                                    Image(.chevronRight)
                                        .renderingMode(.template)
                                }
                                .foregroundStyle(policyButtons[index].isChecked ? Color(.point) : Color(hex: "#EFEEDF"))
                            })
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 8)

                }
            }
            .padding(.horizontal, 24)

            Text(PolicyNotice)
                .textModifier(.pretendard, 400, 10, "#A8A7A1")
                .multilineTextAlignment(.center)

            Spacer()

            Button(action: {
                // 카카오톡 실행 가능 여부 확인 TODO: 소셜 로그인 별 로직 분리 -> SocialLoginController 생성
                if UserApi.isKakaoTalkLoginAvailable() {
                    UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("loginWithKakaoTalk() success.")
                            _ = oauthToken
                            print("토큰 : \(String(describing: oauthToken?.accessToken))")

                            isSheetPresented.toggle() // TODO: dismiss() 사용시 왜 error?
                            coordinator.push(.signUpView)
                        }
                    }
                }

                isSheetPresented.toggle() // TODO: dismiss() 사용시 왜 error?
                coordinator.push(.signUpView)
            }, label: {
                Text("다음으로")
                    .blockableButtonTextModifier($isAllSelected)
            })
            .disabled(isAllSelected ? false : true)
            .tint(isAllSelected ? .clear : Color(hex: "#525250"))
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
        .presentationDetents([.fraction(0.67)])
        .presentationBackground(Color(hex: "#323230"))
    }
}

#Preview {
    InitialBottomSheet(isSheetPresented: .constant(false))
    .background(Color.background)
}
