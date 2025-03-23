//
//  AuthServiceImpl.swift
//  Quack
//
//  Created by 차차 on 3/23/25.
//

import Foundation
import Moya
import Combine

class AuthService: AuthServiceProtocol {
    private let provider: MoyaProvider<AuthEndpoint>
    private let socialLoginController: SocialLoginController

    init(provider: MoyaProvider<AuthEndpoint> = MoyaProvider<AuthEndpoint>(plugins: [NetworkLoggerPlugin()]),
         socialLoginController: SocialLoginController = SocialLoginController()) {
        self.provider = provider
        self.socialLoginController = socialLoginController
    }

    func login(_ socialLoginType: SocialLoginType) async throws -> LoginResponse {
        do {

            guard let oAuthAccessToken = await socialLoginController.socialLogin(socialLoginType) else {
                throw APIError.unauthorized
            }

            return try await loginToQuack(.login(oAuthAccessToken: oAuthAccessToken, socialLoginType: socialLoginType.rawValue), socialLoginType)
        } catch {
            throw error
        }
    }

    // ✅
    func logout(_ socialLoginType: SocialLoginType) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.logout(socialLoginType: socialLoginType.rawValue)) { result in
                switch result {
                case .success:
                    LoginManager.shared.clearJWTToken()
                    continuation.resume(returning: ())
                case .failure(let error):
                    continuation.resume(throwing: APIError.networkError(error))
                }
            }
        }
    }

    // ✅
    func getInitialSignUpInfo() async throws -> SignUpInfo {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getInitialSignUpInfo) { result in
                switch result {
                case .success(let response):
                    do {
                        let signUpInfo = try JSONDecoder().decode(SignUpInfo.self, from: response.data)

                        continuation.resume(returning: signUpInfo)
                    } catch {
                        continuation.resume(throwing: APIError.decodingFailure(error))
                    }
                case .failure(let error):
                    continuation.resume(throwing: APIError.networkError(error))
                }
            }
        }
    }

    // ✅
    func signup(nickname: String) async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.signup(nickname: nickname)) { result in
                switch result {
                case .success(let response):
                    do {
                        let signUpResponse = try JSONDecoder().decode(SignUpResponse.self, from: response.data)

                        continuation.resume(returning: signUpResponse.isRegister)
                    } catch {
                        continuation.resume(throwing: APIError.decodingFailure(error))
                    }
                case .failure(let error):
                    continuation.resume(throwing: APIError.networkError(error))
                }
            }
        }
    }

    // ✅
    private func loginToQuack(_ endpoint: AuthEndpoint, _ socialLoginType: SocialLoginType) async throws -> LoginResponse {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(endpoint) { result in
                switch result {
                case .success(let response):
                    do {
                        let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: response.data)

                        LoginManager.shared.saveJWTToken(
                            loginResponse.jwtAccessToken,
                            loginResponse.jwtRefreshToken,
                            socialLoginType
                        )

                        LoginManager.shared.saveLoginResponse(loginResponse, socialLoginType)

//                        continuation.resume(returning: LoginManager.shared.loginResponse)
                        continuation.resume(returning: loginResponse)
//                        continuation.resume(returning: LoginManager.shared.jwtAccessToken!)
                    } catch {
                        continuation.resume(throwing: APIError.decodingFailure(error))
                    }
                case .failure(let error):
                    continuation.resume(throwing: APIError.networkError(error))
                }
            }
        }
    }
}
