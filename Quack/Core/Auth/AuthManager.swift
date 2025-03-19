//
//  AuthManager.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation
import Combine

class AuthManager {
    static let shared = AuthManager()
    
    @Published private(set) var token: String?
    @Published private(set) var isLoggedIn = false
    
    private let tokenKey = "auth_token"
    
    init() {
        token = UserDefaults.standard.string(forKey: tokenKey)
        isLoggedIn = token != nil
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
}
