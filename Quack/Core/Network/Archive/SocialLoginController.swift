//
//  SocialLoginController.swift
//  Quack
//
//  Created by 차차 on 3/9/25.
//

import Foundation
import KakaoSDKUser
import KakaoSDKAuth

@MainActor
class SocialLoginController: ObservableObject {
    var oauthToken: OAuthToken?

    nonisolated init() {
    }

    func socialLogin(_ socialLoginType: SocialLoginType) async -> String? {
        return await withCheckedContinuation { continuation in
            switch socialLoginType {
            case .kakao:
                if UserApi.isKakaoTalkLoginAvailable() {
                    UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                        if let error = error {
                            print(error)
                            continuation.resume(returning: "")
                        } else {
                            let oAuthAccessToken = oauthToken?.accessToken ?? ""
                            continuation.resume(returning: oAuthAccessToken) 
                        }
                    }
                } else {
                    continuation.resume(returning: "")
                }
            case .apple:
                break

            default:
                continuation.resume(returning: "")
            }
        }
    }
}
