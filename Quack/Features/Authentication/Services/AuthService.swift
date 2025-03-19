//
//  AuthService.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation
import KakaoSDKUser
import KakaoSDKAuth
import Combine

protocol AuthServiceProtocol {
    func loginWithKakao() async throws -> User
    func logout() async throws -> Bool
    func refreshToken() async throws -> Bool
    var isLoggedIn: Bool { get }
}

class AuthService: AuthServiceProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    var isLoggedIn: Bool {
        return AuthManager.shared.isLoggedIn
    }
    
    func loginWithKakao() async throws -> User {
        return try await withCheckedThrowingContinuation { continuation in
            // 카카오톡 설치 여부 확인
            if UserApi.isKakaoTalkLoginAvailable() {
                // 카카오톡으로 로그인
                UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                    if let error = error {
                        continuation.resume(throwing: AuthError.socialLoginFailed(error))
                        return
                    }
                    
                    guard let token = oauthToken else {
                        continuation.resume(throwing: AuthError.tokenNotReceived)
                        return
                    }
                    
                    // 사용자 정보 요청
                    self.getUserInfo(token: token) { result in
                        switch result {
                        case .success(let user):
                            continuation.resume(returning: user)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
                }
            } else {
                // 카카오 계정으로 로그인
                UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                    if let error = error {
                        continuation.resume(throwing: AuthError.socialLoginFailed(error))
                        return
                    }
                    
                    guard let token = oauthToken else {
                        continuation.resume(throwing: AuthError.tokenNotReceived)
                        return
                    }
                    
                    // 사용자 정보 요청
                    self.getUserInfo(token: token) { result in
                        switch result {
                        case .success(let user):
                            continuation.resume(returning: user)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
                }
            }
        }
    }
    
    private func getUserInfo(token: OAuthToken, completion: @escaping (Result<User, Error>) -> Void) {
        // 토큰 저장
        AuthManager.shared.saveToken(token.accessToken)
        
        // 사용자 정보 요청
        UserApi.shared.me { kakaoUser, error in
            if let error = error {
                completion(.failure(AuthError.userInfoFailed(error)))
                return
            }
            
            guard let kakaoUser = kakaoUser else {
                completion(.failure(AuthError.userInfoNotReceived))
                return
            }
            
            // 백엔드 서버에 소셜 로그인 정보 전송 및 사용자 정보 받기
            Task {
                do {
                    let user = try await self.registerSocialUser(provider: .kakao, providerId: "\(kakaoUser.id)", email: kakaoUser.kakaoAccount?.email)
                    completion(.success(user))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func registerSocialUser(provider: SocialMediaType, providerId: String, email: String?) async throws -> User {
        // 백엔드 서버에 소셜 로그인 정보 전송
        let endpoint = AuthEndpoint.socialLogin(provider: provider.rawValue, providerId: providerId, email: email)
        let response: APIResponse<UserDTO> = try await apiClient.request(endpoint: endpoint)
        
        let user = response.data.toDomain()
        
        // 사용자 정보를 앱 상태에 저장
        AuthManager.shared.setCurrentUser(user)
        
        return user
    }
    
    func logout() async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.logout { error in
                if let error = error {
                    continuation.resume(throwing: AuthError.logoutFailed(error))
                    return
                }
                
                // 로컬 인증 상태 초기화
                AuthManager.shared.clearToken()
                AuthManager.shared.clearCurrentUser()
                
                continuation.resume(returning: true)
            }
        }
    }
    
    func refreshToken() async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            // tokenInfo() 메서드를 사용하여 토큰 정보 조회
            AuthApi.shared.tokenInfo { (tokenInfo, error) in
                if let error = error {
                    continuation.resume(throwing: AuthError.tokenRefreshFailed(error))
                    return
                }
                
                // 토큰이 유효하면 갱신 시도
                AuthApi.shared.refreshToken { (oauthToken, error) in
                    if let error = error {
                        continuation.resume(throwing: AuthError.tokenRefreshFailed(error))
                        return
                    }
                    
                    guard let newToken = oauthToken else {
                        continuation.resume(throwing: AuthError.tokenNotReceived)
                        return
                    }
                    
                    // 새 토큰 저장
                    AuthManager.shared.saveToken(newToken.accessToken)
                    continuation.resume(returning: true)
                }
            }
        }
    }
}

// 인증 관련 에러 정의
enum AuthError: Error, LocalizedError {
    case socialLoginFailed(Error)
    case tokenNotReceived
    case userInfoFailed(Error)
    case userInfoNotReceived
    case logoutFailed(Error)
    case tokenRefreshFailed(Error)
    case noTokenToRefresh
    case backendRegistrationFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .socialLoginFailed(let error):
            return "소셜 로그인에 실패했습니다: \(error.localizedDescription)"
        case .tokenNotReceived:
            return "인증 토큰을 받지 못했습니다."
        case .userInfoFailed(let error):
            return "사용자 정보를 가져오지 못했습니다: \(error.localizedDescription)"
        case .userInfoNotReceived:
            return "사용자 정보를 받지 못했습니다."
        case .logoutFailed(let error):
            return "로그아웃에 실패했습니다: \(error.localizedDescription)"
        case .tokenRefreshFailed(let error):
            return "토큰 갱신에 실패했습니다: \(error.localizedDescription)"
        case .noTokenToRefresh:
            return "갱신할 토큰이 없습니다."
        case .backendRegistrationFailed(let error):
            return "서버 등록에 실패했습니다: \(error.localizedDescription)"
        }
    }
}
