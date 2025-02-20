//
//  DataModel.swift
//  Quack
//
//  Created by 차차 on 2/7/25.
//

import Foundation

struct Like {
    let id: Int
    let userId: Int
    let reviewId: Int
    var likeType: String // FIXME: Change to enum
}

struct User {
    let id: Int
    let providerType: SocialMediaType
    let providerId: Int
    let email: String
    var nickname: String
    // let rollType // MARK: 이거 뭐임?
    var profileImg: String
}

struct Restaurant {
    let id: Int
    let userId: Int // MARK: 유저 id 왜 있는지? -> 가게 사장님?
    var name: String
    var address: String
    var category: RestaurantCategory = .korean
    var simpleIntroduction: String = ""
    var detailIntroduction: String = ""
    var latitude: Decimal = 0
    var longitude: Decimal = 0
    let registrationNum: String = ""
    let reprensentativeName: String = ""
    let representatitvePhoneNum: String = ""
    let registrationImg: String = ""
}

struct Review: Hashable {
    let id: Int
    let restaurantId: Int
    let userId: Int
    let reviewType: ReviewType // FIXME: 현재 ReviewType이라는 이름으로 리뷰 작성 페이지에서 사용중(식당 장점, 단점 확인을 위해)
    let createdDate: Date = Date()
    var lastModifiedDate: Date = Date()
}

struct Menu {
    let id: Int
    let restaurantId: Int
    var name: String
    var price: Int
    var description: String
}
