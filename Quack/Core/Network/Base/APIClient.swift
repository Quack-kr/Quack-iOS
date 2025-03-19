//
//  APIClient.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation
import Combine

class APIClient {
    static let shared = APIClient()
    
    private let baseURL = "https://localhost:3000" // TODO: 실제 API 엔드포인트로 대체
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // async/await를 사용한 요청 메서드
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        let request = try prepareRequest(for: endpoint)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw APIError.decodingFailure(error)
            }
        case 401:
            throw APIError.unauthorized
        case 403:
            throw APIError.forbidden
        case 404:
            throw APIError.notFound
        case 500...599:
            throw APIError.serverError(httpResponse.statusCode)
        default:
            throw APIError.unknownError(httpResponse.statusCode)
        }
    }
    
    // Combine을 사용한 요청 메서드
    func requestPublisher<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, Error> {
        do {
            let request = try prepareRequest(for: endpoint)
            
            return session.dataTaskPublisher(for: request)
                .tryMap { data, response in
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw APIError.invalidResponse
                    }
                    
                    switch httpResponse.statusCode {
                    case 200...299:
                        return data
                    case 401:
                        throw APIError.unauthorized
                    case 403:
                        throw APIError.forbidden
                    case 404:
                        throw APIError.notFound
                    case 500...599:
                        throw APIError.serverError(httpResponse.statusCode)
                    default:
                        throw APIError.unknownError(httpResponse.statusCode)
                    }
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    // 요청 준비
    private func prepareRequest(for endpoint: Endpoint) throws -> URLRequest {
        let urlString = baseURL + endpoint.path
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL(urlString)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        // 헤더 추가
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        for (key, value) in endpoint.headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        // 인증 토큰 추가 (필요한 경우)
        if endpoint.requiresAuthentication, let token = AuthManager.shared.token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        // 요청 바디 추가
        if let body = endpoint.body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                throw APIError.encodingFailure(error)
            }
        }
        
        return request
    }
}
