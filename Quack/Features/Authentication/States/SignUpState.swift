//
//  SignUpState.swift
//  Quack
//
//  Created by 차차 on 3/24/25.
//

import Foundation
import Combine

class SignUpState: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var nickname: String = ""
    @Published var email: String?
    @Published var isRegister: Bool = false
    @Published var socialLoginType: SocialLoginType.RawValue?
    @Published var isNicknameProper = true
    @Published var nicknameInstructionText = NicknameInstructionText()

    private let signUpService: SignUpServiceProtocol

    init(signUpService: SignUpServiceProtocol = SignUpService()) {
        self.signUpService = signUpService

//        LoginManager.shared.$socialLoginType
//            .receive(on: RunLoop.main) // UI 업데이트는 메인 스레드에서 수행
//            .assign(to: &$socialLoginType)
    }

    func setInstructionByNicknameLength() {
        if nickname.count < 3 {
            if isNicknameProper {
                nicknameInstructionText = .short
                isNicknameProper.toggle()
            }
        } else if nickname.count > 20 {
            if isNicknameProper {
                nicknameInstructionText = .long
                isNicknameProper.toggle()
            }
        } else {
            if !isNicknameProper {
                nicknameInstructionText = .normal
                isNicknameProper.toggle()
            }
        }
    }

    func getInitialSignUpInfo() async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }

        do {
            let signUpInfo = try await signUpService.getInitialSignUpInfo()

            await MainActor.run {
                nickname = signUpInfo.defaultNickname
                email = signUpInfo.email
                socialLoginType = signUpInfo.socialLoginType

                isLoading = false
            }
        } catch {
            print("### catch", error)
            await MainActor.run {
                errorMessage = (error as? LocalizedError)?.errorDescription ?? "로그아웃에 실패했습니다."
                isLoading = false
            }
        }
    }

    func signup(nickname: String) async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }

        do {
            let isRegister = try await signUpService.signup(nickname: nickname)

            await MainActor.run {
                self.isRegister = isRegister
            }
        } catch {
            await MainActor.run {
                errorMessage = (error as? LocalizedError)?.errorDescription ?? "로그아웃에 실패했습니다."
                isLoading = false
            }
        }
    }

    func getSocialLoginTypeName() -> String {
        switch socialLoginType {
        case "kakao":
            return "카카오"
        case "apple":
            return "애플"
        case "naver":
            return "네이버"
        default:
            return ""
        }
    }
}
