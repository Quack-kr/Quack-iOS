//
//  PostViewModel.swift
//  Quack
//
//  Created by 차차 on 2/21/25.
//

import Foundation
import Moya

@MainActor
class PostViewModel: ObservableObject {
    @Published var getPostData: LoginResponse?
    let provider = MoyaProvider<PostService>(plugins: [NetworkLoggerPlugin()])

    func requestLogin(_ loginRequestParam: LoginRequestParam) async -> LoginResponse? {
        return await withCheckedContinuation { continuation in
            provider.request(.login(param: loginRequestParam)) { result in
                switch result {
                case .success(let response):
                    do {
                        let data = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                        self.getPostData = data
                        print("## \(self.getPostData?.accessToken ?? "No Access Token")")
                        print("## \(self.getPostData?.refreshToken ?? "No Refresh Token")")

                        continuation.resume(returning: data) // ✅ 정상 데이터 반환
                    } catch {
                        print("Decoding Error: \(error)")
                        continuation.resume(returning: nil) // ✅ 오류 발생 시 nil 반환
                    }
                case .failure(let error):
                    print("Network Error: \(error)")
                    continuation.resume(returning: nil) // ✅ 네트워크 오류 시 nil 반환
                }
            }
        }
    }

    func initSignIn() async -> LoginResponse? {
        return await withCheckedContinuation { continuation in
            provider.request(.initSignIn) { result in
                switch result {
                case .success(let response):
                    do {
                        let data = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                        self.getPostData = data

                        continuation.resume(returning: data) // ✅ 정상 데이터 반환
                    } catch {
                        print("Decoding Error: \(error)")
                        continuation.resume(returning: nil) // ✅ 오류 발생 시 nil 반환
                    }
                case .failure(let error):
                    print("Network Error: \(error)")
                    continuation.resume(returning: nil) // ✅ 네트워크 오류 시 nil 반환
                }
            }
        }
    }

}
