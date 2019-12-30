//
//  PostService.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/30.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation
import Alamofire

struct PostService {
    
    static let shared = PostService()
    
    
    func post(_ image: [UIImage], _ url: String, _ category: String, postContent: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVoZGduczE3NjZAZ21haWwuY29tIiwibmFtZSI6IuydtOuPme2biCIsImlhdCI6MTU3NzQwNzg1NiwiZXhwIjoxNTc5OTk5ODU2LCJpc3MiOiJGbG9vZFNlcnZlciJ9.Zf_LNfQIEdFl84r-tPQpT1nLaxdotkFutOxwNQy-w58"
        ]
        
        let body: Parameters = [
            "image" : image,
            "url" : url,
            "category" : category,
            "postContent" : postContent
        ]
    
//        Alamofire.request(APIConstants.PostUpload, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
//            .responseData { response in
//                switch response.result {
//
//                // 통신 성공 - 네트워크 연결
//                case .success:
//                    if let value = response.result.value {
//
//                        if let status = response.response?.statusCode {
//
//                            switch status {
//                            case 200:
//                                do {
//                                    let decoder = JSONDecoder()
//                                    print(value)
////                                    let result = try decoder.decode(ResponseString.self, from: value)
//
//                                    // ResponseString에 있는 success로 분기 처리
//                                    switch result.success {
//
//                                    // NetWorkResult에 있는 case로 분류
//                                    case true:
//                                        print("success")
//                                        completion(.success(result.data))
//                                    case false:
//                                        completion(.requestErr(result.message))
//                                    }
//                                }
//                                catch {
//                                    completion(.pathErr)
//                                    print(error.localizedDescription)
//                                }
//                            case 400:
//                                completion(.pathErr)
//                            case 500:
//                                completion(.serverErr)
//                            default:
//                                break
//                            }// switch
//                        }// iflet
//                    }
//                    break
//
//                // 통신 실패 - 네트워크 연결
//                case .failure(let err):
//                    print(err.localizedDescription)
//                    completion(.networkFail)
//                    // .networkFail이라는 반환 값이 넘어감
//                    break
//                }
//
//
        
    }
}
