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
    
    func uploadPost(pictures: [UIImage], url: String, category: String, postContent: String, completion: @escaping(NetworkResult<Any>)->Void) {

        let token = UserDefaults.standard
        let headers: HTTPHeaders = [
            "Content-Type": "multipart/form-data",
            "Authorization" : "\(token.string(forKey: "Authorization")!)"
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in

            for image in pictures {
                if let imageData = image.jpegData(compressionQuality: 1) {
                    multipartFormData.append(imageData, withName: "images", fileName: "image", mimeType: "image/jpeg")
                }
            }
            multipartFormData.append(url.data(using: .utf8) ?? Data(), withName: "url")
            multipartFormData.append(category.data(using: .utf8) ?? Data(), withName: "category")
            multipartFormData.append(postContent.data(using: .utf8) ?? Data(), withName: "postContent")
            
        }, to: APIConstants.PostUpload, method: .post, headers: headers) { (encodingResult) in

            switch encodingResult {

            case .success(let upload, _, _):
                upload.responseJSON { (response) in
                    print("service 성공")
                    let json = response.result.value
                    print(json)
                }

            case .failure(let encodingError):
                print(encodingError.localizedDescription + "[[[[")
            }
        }
    }

    
    func groupCategory(completion: @escaping(NetworkResult<Any>)->Void) {
            
            let token = UserDefaults.standard
            
            let header: HTTPHeaders = [
                "Content-type" : "application/json",
                "Authorization" : "\(token.string(forKey: "Authorization")!)"
            ]
            
        Alamofire.request(APIConstants.GroupCategory, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
                .responseData { response in
                    
                    //print(response.error?.localizedDescription)
                    switch response.result {
                        
                    // 통신 성공
                    case .success:
                        if let value = response.result.value {
                            print(value)
                            if let status = response.response?.statusCode {
                                print("status" + String(status) )
                                
                                switch status {
                                case 200:
                                    do {
                                        let decoder = JSONDecoder()
                                        
                                        // 데이터 encoding 하는 방법
                                        let result = try
                                        decoder.decode(GroupCategory.self, from: value)
                                        // print("finish decode")
                                        completion(.success(result))
                                        
                                        switch result.message {
                                        
                                        case "그룹 카테고리 조회 성공": completion(.success(result))
                                        
                                        case "invaild data": completion(.requestErr(result))
                                        
                                        default:
                                            break
                                        
                                        }
                                    } catch {
                                        completion(.pathErr)
                                        // print(error.localizedDescription)   // 에러 출력
                                        // debugPrint(error) // check which key is missing
                                    }
                                case 409:
                                    print("실패 409")
                                    completion(.pathErr)
                                case 500:
                                    print("실패 500")
                                    completion(.serverErr)
                                    
                                default:
                                    break
                                }
                            }
                        }
                        break
                        
                    // 통신 실패
                    case .failure(let err):
                        print("error",err.localizedDescription)
                        completion(.networkFail)
                        break
                    }
            }
        }
    }

//{
//    "message": "그룹 카테고리 조회 성공",
//    "data": {
//        "category": [
//            "Flood",
//            "통신",
//            "AI",
//            "IT"
//        ]
//    }
//}

