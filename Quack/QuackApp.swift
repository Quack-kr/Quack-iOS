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
        KakaoSDK.initSDK(appKey: KakaoAppKey)

    }
    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL(perform: { url in // MARK: - onOpenURL()에 대해 학습하기
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                   _ = AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
