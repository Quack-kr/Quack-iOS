//
//  MyPageState.swift
//  Quack
//
//  Created by 차차 on 3/23/25.
//

import Foundation
import Combine
import Moya

@MainActor
class MyPageState: ObservableObject {
    private let provider = MoyaProvider<MyPageEndpoint>(plugins: [NetworkLoggerPlugin()])

    @Published var userProfile: UserProfileDTO?
    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var userReviews: [UserReviewDTO] = []
    @Published var isLoadingReviews = false
    @Published var reviewsTotalPages = 0
    @Published var reviewsCurrentPage = 0

    @Published var savedRestaurants: [SavedRestaurantDTO] = []
    @Published var isLoadingSaved = false
    @Published var savedTotalPages = 0
    @Published var savedCurrentPage = 0

    @Published var inquiries: [InquiryDTO] = []
    @Published var isLoadingInquiries = false
    @Published var inquiriesTotalPages = 0
    @Published var inquiriesCurrentPage = 0
    @Published var selectedInquiry: InquiryDetailDTO?

    func fetchUserProfile() async {
        isLoading = true
        errorMessage = nil

        do {
            let response = try await withCheckedThrowingContinuation { continuation in
                provider.request(.getUserProfile) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<UserProfileDTO>.self, from: response.data)
                            if apiResponse.success, let profile = apiResponse.data {
                                continuation.resume(returning: profile)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            self.userProfile = response
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    func updateUserProfile(nickname: String, profileImage: Data? = nil) async -> Bool {
        isLoading = true
        errorMessage = nil

        do {
            let success = try await withCheckedThrowingContinuation { continuation in
                provider.request(.updateUserProfile(nickname: nickname, profileImage: profileImage)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<UserProfileDTO>.self, from: response.data)
                            if apiResponse.success {
                                continuation.resume(returning: true)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            if success {
                await fetchUserProfile()
            }

            isLoading = false
            return success
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
            return false
        }
    }


    func fetchUserReviews(page: Int = 0, size: Int = 10) async {
        if page == 0 {
            userReviews = []
        }

        isLoadingReviews = true
        errorMessage = nil

        do {
            let response = try await withCheckedThrowingContinuation { continuation in
                provider.request(.getUserReviews(page: page, size: size)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<UserReviewsResponseDTO>.self, from: response.data)
                            if apiResponse.success, let reviewsResponse = apiResponse.data {
                                continuation.resume(returning: reviewsResponse)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            if page == 0 {
                self.userReviews = response.content
            } else {
                self.userReviews.append(contentsOf: response.content)
            }

            self.reviewsTotalPages = response.totalPages
            self.reviewsCurrentPage = response.pageable.pageNumber
            isLoadingReviews = false
        } catch {
            errorMessage = error.localizedDescription
            isLoadingReviews = false
        }
    }

    /// 사용자 리뷰 더 불러오기 (페이징)
    func loadMoreReviews() async {
        if reviewsCurrentPage + 1 < reviewsTotalPages && !isLoadingReviews {
            await fetchUserReviews(page: reviewsCurrentPage + 1)
        }
    }

    /// 리뷰 삭제
    func deleteReview(restaurantId: Int, reviewId: Int) async -> Bool {
        isLoading = true
        errorMessage = nil

        do {
            let success = try await withCheckedThrowingContinuation { continuation in
                provider.request(.deleteReview(restaurantId: restaurantId, reviewId: reviewId)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<Bool>.self, from: response.data)
                            if apiResponse.success {
                                continuation.resume(returning: true)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 401, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            if success {
//                self.userReviews.removeAll { $0.id == id }

                await fetchUserProfile()
            }

            isLoading = false
            return success
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
            return false
        }
    }

    // MARK: - 저장함

    /// 저장한 레스토랑 불러오기
    func fetchSavedRestaurants(page: Int = 0, size: Int = 10) async {
        if page == 0 {
            savedRestaurants = []
        }

        isLoadingSaved = true
        errorMessage = nil

        do {
            let response = try await withCheckedThrowingContinuation { continuation in
                provider.request(.getSavedRestaurants(page: page, size: size)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<SavedRestaurantsResponseDTO>.self, from: response.data)
                            if apiResponse.success, let savedResponse = apiResponse.data {
                                continuation.resume(returning: savedResponse)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            if page == 0 {
                self.savedRestaurants = response.content
            } else {
                self.savedRestaurants.append(contentsOf: response.content)
            }

            self.savedTotalPages = response.totalPages
            self.savedCurrentPage = response.pageable.pageNumber
            isLoadingSaved = false
        } catch {
            errorMessage = error.localizedDescription
            isLoadingSaved = false
        }
    }

    /// 저장된 레스토랑 더 불러오기 (페이징)
    func loadMoreSavedRestaurants() async {
        if savedCurrentPage + 1 < savedTotalPages && !isLoadingSaved {
            await fetchSavedRestaurants(page: savedCurrentPage + 1)
        }
    }

    /// 레스토랑 저장
    func saveRestaurant(id: Int) async -> Bool {
        isLoading = true
        errorMessage = nil

        do {
            let success = try await withCheckedThrowingContinuation { continuation in
                provider.request(.saveRestaurant(restaurantId: id)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<Bool>.self, from: response.data)
                            if apiResponse.success {
                                continuation.resume(returning: true)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            if success {
                // 저장 성공 시 프로필 정보 업데이트 (북마크 수 변경)
                await fetchUserProfile()
                // 저장된 목록 다시 불러오기
                await fetchSavedRestaurants()
            }

            isLoading = false
            return success
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
            return false
        }
    }

    /// 저장한 레스토랑 삭제
    func removeSavedRestaurant(id: Int) async -> Bool {
        isLoading = true
        errorMessage = nil

        do {
            let success = try await withCheckedThrowingContinuation { continuation in
                provider.request(.removeSavedRestaurant(restaurantId: id)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<Bool>.self, from: response.data)
                            if apiResponse.success {
                                continuation.resume(returning: true)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            if success {
                // 삭제 성공 시 목록에서 제거
                self.savedRestaurants.removeAll { $0.id == id }
                // 프로필 정보 업데이트 (북마크 수 변경)
                await fetchUserProfile()
            }

            isLoading = false
            return success
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
            return false
        }
    }

    // MARK: - 문의하기

    /// 문의 목록 불러오기
    func fetchInquiries(page: Int = 0, size: Int = 10) async {
        if page == 0 {
            inquiries = []
        }

        isLoadingInquiries = true
        errorMessage = nil

        do {
            let response = try await withCheckedThrowingContinuation { continuation in
                provider.request(.getInquiries(page: page, size: size)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<InquiriesResponseDTO>.self, from: response.data)
                            if apiResponse.success, let inquiriesResponse = apiResponse.data {
                                continuation.resume(returning: inquiriesResponse)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            if page == 0 {
                self.inquiries = response.content
            } else {
                self.inquiries.append(contentsOf: response.content)
            }

            self.inquiriesTotalPages = response.totalPages
            self.inquiriesCurrentPage = response.pageable.pageNumber
            isLoadingInquiries = false
        } catch {
            errorMessage = error.localizedDescription
            isLoadingInquiries = false
        }
    }

    /// 문의 더 불러오기 (페이징)
    func loadMoreInquiries() async {
        if inquiriesCurrentPage + 1 < inquiriesTotalPages && !isLoadingInquiries {
            await fetchInquiries(page: inquiriesCurrentPage + 1)
        }
    }

    /// 문의 상세 정보 불러오기
    func fetchInquiryDetail(id: Int) async {
        isLoading = true
        errorMessage = nil

        do {
            let response = try await withCheckedThrowingContinuation { continuation in
                provider.request(.getInquiryDetail(id: id)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<InquiryDetailDTO>.self, from: response.data)
                            if apiResponse.success, let detail = apiResponse.data {
                                continuation.resume(returning: detail)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            self.selectedInquiry = response
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    /// 문의 생성
    func createInquiry(title: String, content: String, images: [Data]? = nil) async -> Bool {
        isLoading = true
        errorMessage = nil

        do {
            let success = try await withCheckedThrowingContinuation { continuation in
                provider.request(.createInquiry(title: title, content: content, images: images)) { result in
                    switch result {
                    case .success(let response):
                        do {
                            let apiResponse = try JSONDecoder().decode(ApiResponseDTO<InquiryDTO>.self, from: response.data)
                            if apiResponse.success {
                                continuation.resume(returning: true)
                            } else if let error = apiResponse.error {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message]))
                            } else {
                                continuation.resume(throwing: NSError(domain: "API", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
                            }
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }

            if success {
                // 문의 작성 성공 시 목록 다시 불러오기
                await fetchInquiries()
            }

            isLoading = false
            return success
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
            return false
        }
    }
}
