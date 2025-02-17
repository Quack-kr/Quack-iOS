//
//  SearchedShop.swift
//  Quack
//
//  Created by 차차 on 1/31/25.
//

import Foundation

struct SearchedShop: Hashable {
    let shopName: String
    let img: String = ".dummyMenu"
    
    init(shopName: String) {
        self.shopName = shopName
    }
}
