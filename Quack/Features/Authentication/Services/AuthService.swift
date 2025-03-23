// AuthService.swift
import Foundation
import Moya

enum AuthService {
    case kakaoLogin(accessToken: String)
    case appleLogin(idToken: String)
    case naverLogin(accessToken: String)
    case logout
}

extension AuthService: TargetType {
    var baseURL: URL {
        return URL(string: "https://localhost:3000/")! // 실제 서버 URL로 변경 필요
    }
    
    var path: String { // TODO: 소셜 로그인 타입 변수로 전달받아서 return값 설정
        switch self {
        case .kakaoLogin:
            return "/auth/login/kakao"
        case .appleLogin:
            return "/auth/login/apple"
        case .naverLogin:
            return "/auth/login/naver"
        case .logout:
            return "/auth/logout/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .kakaoLogin, .appleLogin, .naverLogin:
            return .post
        case .logout: // TODO: DELETE
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .kakaoLogin(let accessToken):
            return .requestParameters(
                parameters: ["Kakao-Access-token": accessToken],
                encoding: JSONEncoding.default
            )
        case .appleLogin(let idToken):
            return .requestParameters(
                parameters: ["idToken": idToken], // TODO: Need to Change
                encoding: JSONEncoding.default
            )
        case .naverLogin(let accessToken):
            return .requestParameters(
                parameters: ["accessToken": accessToken], // TODO: Need to Change
                encoding: JSONEncoding.default
            )
        case .logout:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        // 테스트용 샘플 데이터
        return Data()
    }
}
