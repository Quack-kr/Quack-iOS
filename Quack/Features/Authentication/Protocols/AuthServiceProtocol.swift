//
//  AuthServiceProtocol.swift
//  Quack
//
//  Created by 차차 on 3/23/25.
//

import Foundation

protocol AuthServiceProtocol {
    func login(_ socialLoginType: SocialLoginType) async throws -> LoginResponse

    func logout(_ socialLoginType: SocialLoginType) async throws
}
