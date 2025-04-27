//
//  MyPageEndpoint.swift
//  Quack
//
//  Created by 차차 on 3/23/25.
//

import Foundation
import Moya

enum MyPageEndpoint {

    case getUserProfile
    case updateUserProfile(nickname: String, profileImage: Data?)

    case getUserReviews(page: Int, size: Int)
    case deleteReview(restaurantId: Int, reviewId: Int)

    case getSavedRestaurants(page: Int, size: Int)
    case saveRestaurant(restaurantId: Int)
    case removeSavedRestaurant(restaurantId: Int)

    case getInquiries(page: Int, size: Int)
    case createInquiry(title: String, content: String, images: [Data]?)
    case getInquiryDetail(id: Int)
}

extension MyPageEndpoint: TargetType {
    var baseURL: URL {
        return URL(string: Bundle.main.infoDictionary?["ServerURI"] as! String)!
    }

    var path: String {
        switch self {
        case .getUserProfile:
            return "/profile"
        case .updateUserProfile: // TODO: - URI Path 변경
            return "/profile/update"

        case .getUserReviews:
            return "/reviews/my-reviews"
        case .deleteReview(let restaurantId, let reviewId):
            return "/restaurant/\(restaurantId)/\(reviewId)/delete"

        case .getSavedRestaurants:
            return "/restaurant"
        case .saveRestaurant(let restaurantId):
            return "/restaurant/\(restaurantId)/save"
        case .removeSavedRestaurant(let restaurantId):
            return "/restaurant/\(restaurantId)/delete"

        case .getInquiries:
            return "/inquiries"
        case .createInquiry:
            return "/inquiries/create"
        case .getInquiryDetail(let inquiryId):
            return "/inquiries/\(inquiryId)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getUserProfile, .getUserReviews, .getSavedRestaurants, .getInquiries, .getInquiryDetail:
            return .get
        case .createInquiry, .saveRestaurant, .updateUserProfile, .deleteReview, .removeSavedRestaurant:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .getUserProfile, .getInquiryDetail, .deleteReview, .removeSavedRestaurant, .saveRestaurant:
            return .requestPlain

        case .updateUserProfile(let nickname, let profileImage):
            var multipartFormData: [MultipartFormData] = []

            if let nicknameData = nickname.data(using: .utf8) {
                multipartFormData.append(MultipartFormData(provider: .data(nicknameData), name: "nickname"))
            }

            if let imageData = profileImage {
                multipartFormData.append(MultipartFormData(provider: .data(imageData), name: "profileImage", fileName: "profile.jpg", mimeType: "image/jpeg"))
            }

            return .uploadMultipart(multipartFormData)

        case .getUserReviews(let page, let size), .getSavedRestaurants(let page, let size), .getInquiries(let page, let size):
            return .requestParameters(
                parameters: ["page": page, "size": size],
                encoding: URLEncoding.queryString
            )

        case .createInquiry(let title, let content, let images):
            var multipartFormData: [MultipartFormData] = []

            if let titleData = title.data(using: .utf8) {
                multipartFormData.append(MultipartFormData(provider: .data(titleData), name: "title"))
            }

            if let contentData = content.data(using: .utf8) {
                multipartFormData.append(MultipartFormData(provider: .data(contentData), name: "content"))
            }

            if let imageDataArray = images {
                for (index, imageData) in imageDataArray.enumerated() {
                    multipartFormData.append(MultipartFormData(provider: .data(imageData), name: "images", fileName: "inquiry_image_\(index).jpg", mimeType: "image/jpeg"))
                }
            }

            return .uploadMultipart(multipartFormData)
        }
    }

    var headers: [String: String]? {
        var headers = ["Content-Type": "application/json"]

        if let token = LoginManager.shared.jwtAccessToken {
            headers["Authorization"] = "Bearer \(token)"
        }

        return headers
    }
}
