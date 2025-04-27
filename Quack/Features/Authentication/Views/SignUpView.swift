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
    @StateObject private var signUpState: SignUpState = SignUpState()
    @State private var showAlert = false

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
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("닉네임")
                                    .textModifier(.theJamsil, 700, 14, "#A8A7A1")

                                Spacer()

                                Text("\(signUpState.nickname.count)/20")
                                    .textModifier(.pretendard, 500, 14, "#A8A7A1")
                            }
                            ZStack {
                                TextField("닉네임을 입력하세요.", text: $signUpState.nickname)
                                    .padding(.leading, 16)
                                    .textModifier(.pretendard, 700, 16, "#EFEEDF")
                                    .onChange(of: signUpState.nickname.count) {
                                        signUpState.setInstructionByNicknameLength()
                                    }

                            }
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color(hex: "#323230"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.red, lineWidth: 1)
                                            .opacity(signUpState.isNicknameProper ? 0 : 1)
                                    )
                            )

                            Text(signUpState.nicknameInstructionText.rawValue)
                                .textModifier(.pretendard, 400, 12, signUpState.isNicknameProper ? .point : .red)
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
                                    Text(signUpState.email ?? "")
                                        .padding(.leading, 16)
                                        .textModifier(.pretendard, 700, 16, "#525250")

                                    Spacer()
                                }
                                .foregroundStyle(Color(hex: "#525250"))
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(Color(hex: "#323230"))
                                )
                            }
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color(hex: "#323230"))
                            )

                            Text("\(signUpState.getSocialLoginTypeName())으로 가입한 계정이에요.")
                                .textModifier(.theJamsil, 400, 12, "#A8A7A1")
                                .padding(.leading, 16)
                        }
                    }

                    Spacer()
                    Spacer()

                    Button(action: {
                        Task {
                            await signUpState.signup(nickname: signUpState.nickname)

                            if signUpState.isRegister { // TODO : 테스크 분리하기, 현재 로직 분리가 필요함.
                                coordinator.push(.tabBarView)
                            } else {
                                showAlert = true
                            }
                        }

                    }, label: {
                        Text("시작하기")
                            .blockableButtonTextModifier($signUpState.isNicknameProper)
                    })
                    .disabled(signUpState.isNicknameProper ? false : true)

                }
                .padding(.horizontal, 16)
                .onAppear {
                    Task {
                        await signUpState.getInitialSignUpInfo()
                    }
                }
                .alert("회원가입 실패", isPresented: $showAlert) {
                    Button("확인", role: .cancel) { }
                } message: {
                    Text(signUpState.errorMessage ?? "중복된 닉네임입니다. 다시 설정해주세요.")
                }
    }
}

#Preview {
    SignUpView()
        .background(Color.background)

}
