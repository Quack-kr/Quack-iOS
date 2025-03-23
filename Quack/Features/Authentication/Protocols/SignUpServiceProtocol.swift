//
//  SignUpServcieProtocol.swift
//  Quack
//
//  Created by 차차 on 3/24/25.
//

import Foundation

protocol SignUpServiceProtocol {
    func getInitialSignUpInfo() async throws -> SignUpInfo

    func signup(nickname: String) async throws -> Bool
}
