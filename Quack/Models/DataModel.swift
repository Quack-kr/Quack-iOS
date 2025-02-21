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
    var profileImg: String
}

struct Restaurant {
    let id: Int
    var name: String
    var address: String
    var category: RestaurantCategory = .korean
    var simpleIntroduction: String = ""
    var detailIntroduction: String = ""
    var latitude: Decimal = 0
    var longitude: Decimal = 0
    var restaurantImg: [String] = []
    var reviewList: [Review]
    var menuList: [Menu]
}

struct Review: Hashable {
    let id: Int
    let restaurantId: Int // MARK: 어차피 레스토랑에 맞는 리뷰들을 보내주지 않나?
    let userId: Int
    let reviewType: ReviewType // FIXME: 현재 ReviewType이라는 이름으로 리뷰 작성 페이지에서 사용중(식당 장점, 단점 확인을 위해)
    var content: String
    let createdDate: Date = Date()
    var lastModifiedDate: Date = Date()
    var reviewImg: [String] = []
    // 리뷰 메뉴 평가 배열
}

struct Menu {
    let id: Int
    let restaurantId: Int
    var name: String
    var price: Int
    var description: String
}
