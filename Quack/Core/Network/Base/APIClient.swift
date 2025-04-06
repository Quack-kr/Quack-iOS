//import Foundation
//import Combine
//import Moya
//
//// MARK: - API Client 프로토콜
//protocol AuthClientType {
//    func kakaoLogin(accessToken: String) -> AnyPublisher<LoginResponseDTO, Error>
//    func appleLogin(idToken: String) -> AnyPublisher<LoginResponseDTO, Error>
//    func naverLogin(accessToken: String) -> AnyPublisher<LoginResponseDTO, Error>
//    func logout() -> AnyPublisher<Void, Error>
//}
//
//// MARK: - Moya 기반 Auth 클라이언트
//class MoyaAuthClient: AuthClientType {
//    private let provider: MoyaProvider<AuthEndpoint>
//
//    init(provider: MoyaProvider<AuthEndpoint> = MoyaProvider<AuthEndpoint>()) {
//        self.provider = provider
//    }
//    
//    func kakaoLogin(accessToken: String) -> AnyPublisher<LoginResponseDTO, Error> {
//        performLogin(.kakaoLogin(accessToken: accessToken))
//    }
//    
//    func appleLogin(idToken: String) -> AnyPublisher<LoginResponseDTO, Error> {
//        performLogin(.appleLogin(idToken: idToken))
//    }
//    
//    func naverLogin(accessToken: String) -> AnyPublisher<LoginResponseDTO, Error> {
//        performLogin(.naverLogin(accessToken: accessToken))
//    }
//    
//    func logout() -> AnyPublisher<Void, Error> {
//        Future<Void, Error> { [weak self] promise in
//            guard let self = self else { return }
//            
//            self.provider.request(.logout) { result in
//                switch result {
//                case .success:
//                    promise(.success(()))
//                case .failure(let error):
//                    promise(.failure(error))
//                }
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//    
//    private func performLogin(_ endpoint: AuthService) -> AnyPublisher<LoginResponseDTO, Error> {
//        Future<LoginResponseDTO, Error> { [weak self] promise in
//            guard let self = self else { return }
//            
//            self.provider.request(endpoint) { result in
//                switch result {
//                case .success(let response):
//                    do {
//                        let loginResponse = try JSONDecoder().decode(LoginResponseDTO.self, from: response.data)
//                        promise(.success(loginResponse))
//                    } catch {
//                        promise(.failure(error))
//                    }
//                case .failure(let error):
//                    promise(.failure(error))
//                }
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//}
