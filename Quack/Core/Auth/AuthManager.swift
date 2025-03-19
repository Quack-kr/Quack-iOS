//
//  AuthManager.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation
import Combine

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    
    @Published private(set) var token: String?
    @Published private(set) var isLoggedIn = false
    @Published private(set) var currentUser: User?
    
    private let tokenKey = "auth_token"
    private let userKey = "current_user"
    
    init() {
        // 저장된 토큰 불러오기
        token = UserDefaults.standard.string(forKey: tokenKey)
        isLoggedIn = token != nil
        
        // 저장된 사용자 정보 불러오기
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            do {
                let user = try JSONDecoder().decode(User.self, from: userData)
                currentUser = user
            } catch {
                print("사용자 정보 로드 실패: \(error)")
            }
        }
    }
    
    func saveToken(_ token: String) {
        self.token = token
        isLoggedIn = true
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func clearToken() {
        token = nil
        isLoggedIn = false
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
    
    func setCurrentUser(_ user: User) {
        currentUser = user
        
        // 사용자 정보 저장
        do {
            let userData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: userKey)
        } catch {
            print("사용자 정보 저장 실패: \(error)")
        }
    }
    
    func clearCurrentUser() {
        currentUser = nil
        UserDefaults.standard.removeObject(forKey: userKey)
    }
}
