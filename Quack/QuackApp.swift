//
//  QuackApp.swift
//  Quack
//
//  Created by 차차 on 1/11/25.
//

import SwiftUI
import SwiftData
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

@main
struct QuackApp: App {
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "0a65923ee2966bb3bcdc7f81a4b9759b")
    }
    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                   _ = AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
