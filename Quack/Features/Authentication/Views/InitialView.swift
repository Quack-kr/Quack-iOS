//
//  InitialView.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI
import KakaoSDKUser

struct InitialView: View {
    @StateObject private var authState = AuthState()
    @State private var isSheetPresented = false
    @State private var isAllSelected = false
    @EnvironmentObject private var coordinator: Coordinator<Destination>

    var body: some View {
        ZStack {
            VStack {
                Spacer()

                Image(.logoWithText)
                    .renderingMode(.template)
                    .foregroundStyle(Color(hex: "#EFEEDF"))

                Spacer()

                VStack(spacing: 10) {
                    ForEach(SocialLoginType.allCases, id: \.self) { socialLoginType in
                        Button(action: {
                            Task {
                                await authState.socialLogin(socialLoginType)
                            }
                        }, label: { // TODO: - 타입에 따른 이미지, 텍스트 변경
                            HStack {
                                Spacer()

                                Image(systemName: "message.fill")

                                Text("\(socialLoginType.rawValue)로 계속하기")
                                    .font(.pretendard(.number(700), size: 14))

                                Spacer()
                            }
                            .padding(16)
                            .background(
                                Rectangle()
                                    .cornerRadius(12)
                                    .foregroundStyle(.point)
                            )
                            .foregroundStyle(Color(hex: "#171714"))
                        })
                    }

                    Button(action: {
                        coordinator.push(.tabBarView)
                    }, label: {
                        Text("둘러보기")
                            .textModifier(.pretendard, 500, 14, "#A8A7A1")
                    })
                }
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 29)
            .sheet(isPresented: $isSheetPresented, content: {
                InitialBottomSheet(isSheetPresented: $isSheetPresented)
            })

            if authState.isLoading {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()

                ProgressView()
                    .tint(.white)
                    .scaleEffect(1.5)
            }
        }
        .onChange(of: authState.isNewUser) {
            if authState.isNewUser! {
                coordinator.push(.signUpView)
            } else {
                coordinator.push(.tabBarView)
            }
        }
        .alert("로그인 오류", isPresented: .constant(authState.errorMessage != nil), actions: {
            Button("확인") {
                authState.errorMessage = nil
            }
        }, message: {
            if let errorMessage = authState.errorMessage {
                Text(errorMessage)
            }
        })
    }
}

#Preview {
    InitialView()
        .background(Color.background)
}
