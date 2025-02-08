//
//  DataModel.swift
//  Quack
//
//  Created by 차차 on 2/7/25.
//

import Foundation


struct PostList: Codable {
    let postlist: [Post]
}

struct Post: Codable {
    let img: String
    let title: String
    let subTitle: String
}

struct Recommend: Codable {
    let image: String
    let title: String
    let subTitle: String
}

struct RestaurantBlock: Codable {
    let menuImg: String
    let name: String
    let category: String // TODO: Change To Enum
    let location: String // TODO: Think about type
    let averagePrice: Int
}

