//
//  AuthState.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation
import Combine

class AuthState: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    @Published var oAuthAccessToken: String?
    @Published var socialLoginType: SocialLoginType?
    @Published var isNewUser: Bool?
    @Published var isOAuthCompleted: Bool = false

    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService

        LoginManager.shared.$isLoggedIn
            .receive(on: RunLoop.main) // UI 업데이트는 메인 스레드에서 수행
            .assign(to: &$isLoggedIn)
    }

    func socialLogin(_ socialLoginType: SocialLoginType) async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }
        do {
//            let oAuthAccessToken = try await authService.socialLogin(socialLoginType)
            let loginResponse = try await authService.login(socialLoginType)
            await MainActor.run {
                self.oAuthAccessToken = loginResponse.jwtAccessToken
                self.socialLoginType = socialLoginType
                self.isOAuthCompleted = true
                self.isLoading = false
                self.isNewUser = loginResponse.isNewUser
            }
        } catch {
            await MainActor.run {
                self.errorMessage = (error as? LocalizedError)?.errorDescription ?? "로그인에 실패했습니다."
                self.isLoading = false
            }
        }
    }

    func logout() async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }

        do {
            try await authService.logout(socialLoginType!)

            await MainActor.run {
                self.oAuthAccessToken = nil
                self.socialLoginType = nil
                self.isOAuthCompleted = false
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.errorMessage = (error as? LocalizedError)?.errorDescription ?? "로그아웃에 실패했습니다."
                self.isLoading = false
            }
        }
    }
}
