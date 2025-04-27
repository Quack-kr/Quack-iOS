//
//  AuthEndpoint.swift
//  Quack
//
//  Created by 차차 on 3/23/25.
//

import Foundation
import Moya

enum AuthEndpoint {
    case login(oAuthAccessToken: String, socialLoginType: String)

    case logout(socialLoginType: String)

    case getInitialSignUpInfo
    case signup(nickname: String)
}

extension AuthEndpoint: TargetType {
    var baseURL: URL {
//        return URL(string: Bundle.main.infoDictionary?["ServerURI"] as! String)!
        return URL(string: "http://192.168.35.163:3000")!
    }

    var path: String {
        switch self {
        case .login(_, let socialLoginType):
            return "/auth/login/?client_type=\"\(socialLoginType)\""
        case .logout(let socialLoginType):
            return "/auth/logout"
        case .getInitialSignUpInfo, .signup:
            return "/registration"
        }
    }

    var method: Moya.Method {
        switch self {
        case .logout, .getInitialSignUpInfo:
            return .get
        case .signup, .login:
            return .post

        }
    }

    var task: Task {
        switch self {
        case .login(let oAuthAccessToken, _):
            return .requestParameters(
                parameters: ["accessToken": oAuthAccessToken],
                encoding: JSONEncoding.default
            )

        case .signup(let nickname):
            return .requestParameters(
                parameters: ["nickname": nickname],
                encoding: JSONEncoding.default
            )

        case .logout, .getInitialSignUpInfo:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        var headers = ["Content-type": "application/json"]

        if case .logout = self, let token = LoginManager.shared.jwtAccessToken {
            headers["Authorization"] = "Bearer \(token)"
        }

        return headers
    }
}
