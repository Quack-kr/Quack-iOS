//
//  PostViewModel.swift
//  Quack
//
//  Created by 차차 on 2/21/25.
//

import Foundation
import Moya

class PostViewModel: ObservableObject {
    @Published var getPostData: GetPostData?

    func requestPost() {
        let provider = MoyaProvider<PostService>()
        provider.request(.getPost) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(GetPostData.self, from: response.data)
                    self.getPostData = data
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }

        }
    }
}
