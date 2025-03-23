//
//  AppState.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

class AppState: ObservableObject {
    // 1. 사용자 인증 관련 상태
    @Published var currentUser: User?
    @Published var isLoggedIn: Bool = false
    @Published var authenticationState: AuthenticationState = .notAuthenticated
    
    // 2. 앱 설정 및 환경 설정
    @Published var currentLocation: String = "왕십리"
    @Published var appSettings: AppSettings = AppSettings()
    
    // 3. 전역 UI 상태
    @Published var isLoading: Bool = false
    @Published var globalErrorMessage: String?
    @Published var toastMessage: ToastMessage?
    
    // 4. 네트워크 연결 상태
    @Published var isNetworkAvailable: Bool = true
    
    // 5. 알림 관련 상태
    @Published var hasUnreadNotifications: Bool = false
    @Published var notificationCount: Int = 0
    
    // 6. 앱 진입 경로 및 딥링크 관련
    @Published var deepLinkDestination: DeepLinkDestination?
    
    // 초기화 및 상태 관리 메서드
    init() {
        loadSavedUserState()
        setupNetworkMonitoring()
    }
    
    // 사용자 로그인 상태 관리
    func login(user: User) {
        self.currentUser = user
        self.isLoggedIn = true
        self.authenticationState = .authenticated
        // 사용자 정보 저장 로직
    }
    
    func logout() {
        self.currentUser = nil
        self.isLoggedIn = false
        self.authenticationState = .notAuthenticated
        // 로그아웃 관련 정리 작업
    }
    
    // 앱 설정 업데이트
    func updateLocation(_ location: String) {
        currentLocation = location
        // 위치 정보 저장
    }
    
    func updateAppSettings(_ settings: AppSettings) {
        appSettings = settings
        // 설정 저장
    }
    
    // 토스트 메시지 표시
    func showToast(message: String, type: ToastType = .info) {
        toastMessage = ToastMessage(message: message, type: type)
        // 일정 시간 후 메시지 자동 제거 로직
    }
    
    // 에러 처리
    func handleGlobalError(_ error: Error) {
        globalErrorMessage = error.localizedDescription
    }
    
    // 앱 시작 시 저장된 사용자 상태 로드
    private func loadSavedUserState() {
        // UserDefaults나 KeyChain에서 사용자 정보 로드
    }
    
    // 네트워크 모니터링 설정
    private func setupNetworkMonitoring() {
        // 네트워크 연결 상태 감시 로직
    }
}

// 앱 설정 모델
struct AppSettings: Codable, Equatable {
    var isDarkModeEnabled: Bool = false
    var notificationsEnabled: Bool = true
    var marketingNotificationsEnabled: Bool = false
    var defaultFilterSettings: FilterSettings = FilterSettings()
}

// 인증 상태 열거형
enum AuthenticationState {
    case notAuthenticated
    case authenticating
    case authenticated
    case failed(String)
}

// 토스트 메시지 모델
struct ToastMessage: Identifiable {
    let id = UUID()
    let message: String
    let type: ToastType
    let timestamp = Date()
}

// 토스트 메시지 타입
enum ToastType {
    case info
    case success
    case warning
    case error
}

// 딥링크 목적지 열거형
enum DeepLinkDestination {
    case restaurant(id: Int)
    case review(id: Int)
    case search(query: String)
    case notification
}

// 필터 설정 모델
struct FilterSettings: Codable, Equatable {
    var showOpenOnly: Bool = true
    var sortBy: SortOption = .distance
    var priceRange: ClosedRange<Int> = 0...50000
    var selectedCategories: [String] = []
}

// 정렬 옵션 열거형
enum SortOption: String, Codable {
    case distance = "거리순"
    case popularity = "인기순"
    case rating = "평점순"
    case newest = "최신순"
}
