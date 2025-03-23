//
//  MyPageService.swift
//  Quack
//
//  Created by 차차 on 3/23/25.
//

import Foundation
import Moya


class MyPageServiceImpl: MyPageServiceProtocol {
    private let provider: MoyaProvider<MyPageEndpoint>

    init(provider: MoyaProvider<MyPageEndpoint> = MoyaProvider<MyPageEndpoint>(plugins: [NetworkLoggerPlugin()])) {
        self.provider = provider
    }

    
}
