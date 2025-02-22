//
//  User.swift
//  Quack
//
//  Created by 차차 on 2/1/25.
//

import Foundation

class CurrentUser: ObservableObject {
    @Published var socialLoginType = SocialMediaType()
    @Published var isLogIn = false
}
