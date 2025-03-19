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
    @Published var user: User?
    
    private let authService: AuthServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
        
        // AuthManager 상태 감시
        AuthManager.shared.$isLoggedIn
            .assign(to: &$isLoggedIn)
        
        AuthManager.shared.$currentUser
            .assign(to: &$user)
    }
    
    func loginWithKakao() async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }
        
        do {
            let user = try await authService.loginWithKakao()
            
            await MainActor.run {
                self.user = user
                self.isLoading = false
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
            _ = try await authService.logout()
            
            await MainActor.run {
                self.user = nil
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
