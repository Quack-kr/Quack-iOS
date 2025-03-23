//
//  AuthManager.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation
import Combine

class LoginManager: ObservableObject {
    static let shared = LoginManager()
    
    @Published private(set) var jwtAccessToken: String?
    @Published private(set) var jwtRefreshToken: String?
    @Published private(set) var isLoggedIn = false
    @Published private(set) var isNewUser: Bool?
    @Published private(set) var socialLoginType: SocialLoginType?
    @Published private(set) var loginResponse: LoginResponse?

    private let jwtAccessTokenKey = "jwt_auth_token"
    private let jwtRefreshTokenKey = "jwt_refresh_token"
    private let socialLoginTypeKey = "social_login_type"

    init() {
        jwtAccessToken = UserDefaults.standard.string(forKey: jwtAccessTokenKey)
        isLoggedIn = jwtAccessToken != nil

        if AppState.shared.isLoggedIn {
            socialLoginType = SocialLoginType(rawValue: UserDefaults.standard.string(forKey: socialLoginTypeKey)!)
        }
    }

    func saveLoginResponse(_ loginResponse: LoginResponse, _ socialLoginType: SocialLoginType) {
        self.jwtAccessToken = loginResponse.jwtAccessToken
        self.jwtRefreshToken = loginResponse.jwtRefreshToken
        self.isNewUser = loginResponse.isNewUser
        self.socialLoginType = socialLoginType

        isLoggedIn = true

        UserDefaults.standard.set(jwtAccessToken, forKey: jwtAccessTokenKey)
        UserDefaults.standard.set(jwtRefreshToken, forKey: jwtRefreshTokenKey)
        UserDefaults.standard.set(socialLoginType.rawValue, forKey: socialLoginTypeKey)
    }

    func saveJWTToken(_ jwtAccessToken: String, _ jwtRefreshToken: String, _ socialMediaType: SocialLoginType) {
        self.jwtAccessToken = jwtAccessToken
        self.jwtRefreshToken = jwtRefreshToken
        self.socialLoginType = socialMediaType

        isLoggedIn = true

        UserDefaults.standard.set(jwtAccessToken, forKey: jwtAccessTokenKey)
        UserDefaults.standard.set(jwtRefreshToken, forKey: jwtRefreshTokenKey)
        UserDefaults.standard.set(socialMediaType.rawValue, forKey: socialLoginTypeKey)
    }
    
    func clearJWTToken() {
        jwtAccessToken = nil
        jwtRefreshToken = nil
        socialLoginType = nil

        isLoggedIn = false

        UserDefaults.standard.removeObject(forKey: jwtAccessTokenKey)
        UserDefaults.standard.removeObject(forKey: jwtRefreshTokenKey)
        UserDefaults.standard.removeObject(forKey: socialLoginTypeKey)
    }

}
