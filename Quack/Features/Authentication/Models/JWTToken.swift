//
//  JWTToken.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

struct JWTToken: Codable {
    let accessToken: String
    let refreshToken: String
}
