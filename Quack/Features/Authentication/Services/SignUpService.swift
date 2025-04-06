//
//  SignUpService.swift
//  Quack
//
//  Created by 차차 on 3/24/25.
//

import Foundation
import Moya
import Combine

class SignUpService: SignUpServiceProtocol {
    private let provider: MoyaProvider<AuthEndpoint>

    init(provider: MoyaProvider<AuthEndpoint> = MoyaProvider<AuthEndpoint>(plugins: [NetworkLoggerPlugin()])) {
        self.provider = provider
    }

    func getInitialSignUpInfo() async throws -> SignUpInfo {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getInitialSignUpInfo) { result in
                switch result {
                case .success(let response):
                    do {
                        let signUpInfo = try JSONDecoder().decode(SignUpInfo.self, from: response.data)
                        
                        continuation.resume(returning: signUpInfo)
                    } catch {
                        print("Decoding Failed", error)
                        continuation.resume(throwing: APIError.decodingFailure(error))
                    }
                case .failure(let error):
                    continuation.resume(throwing: APIError.networkError(error))
                }
            }
        }
    }

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
}
