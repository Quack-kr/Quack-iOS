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
    var socialLoginType: SocialMediaType = .kakao
    var oauthToken: OAuthToken?

    func login() async -> String? {
        return await withCheckedContinuation { continuation in
            switch socialLoginType {
            case .kakao:
                if UserApi.isKakaoTalkLoginAvailable() {
                    UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                        if let error = error {
                            print(error)
                            continuation.resume(returning: "")
                        } else {
                            let token = oauthToken?.accessToken ?? ""
                            continuation.resume(returning: token) 
                        }
                    }
                } else {
                    continuation.resume(returning: "")
                }
            default:
                continuation.resume(returning: "")
            }
        }
    }
}
