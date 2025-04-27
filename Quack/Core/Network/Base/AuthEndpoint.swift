import Foundation
import Moya

enum AuthEndpoint {
    case appleLogin(idToken: String)
    // ... existing code ...
}

extension AuthEndpoint: TargetType {
    var baseURL: URL {
        return URL(string: "https://0e0f-220-85-24-114.ngrok-free.app/")!
    }
    
    var path: String {
        switch self {
        case .appleLogin:
            return "auth/login"
        // ... existing code ...
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .appleLogin:
            return .post
        // ... existing code ...
        }
    }
    
    var task: Task {
        switch self {
        case .appleLogin:
            return .requestPlain
        // ... existing code ...
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .appleLogin(let idToken):
            return [
                "id-token": idToken,
                "Content-Type": "application/json"
            ]
        // ... existing code ...
        }
    }
} 