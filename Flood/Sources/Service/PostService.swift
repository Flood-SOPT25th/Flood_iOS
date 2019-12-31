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

        let token = UserDefaults.standard

        let header: HTTPHeaders = [
            "Content-Type": "multipart/form-data",
            "Authorization" : "\(token.string(forKey: "Authorization")!)"
        ]
        
        let body: Parameters = [
            "image" : image,
            "url" : url,
            "category" : category,
            "postContent" : postContent
        ]
        
        //Alamofire.upload(.POST, APIConstants.PostUpload, multipartFormData: {
            
        //})
    }
    func groupCategory(completion: @escaping(NetworkResult<Any>)->Void) {
            
            let token = UserDefaults.standard
            
            let header: HTTPHeaders = [
                "Context-type" : "application/json",
                "Authorization" : "\(token.string(forKey: "Authorization")!)"
            ]
            
        Alamofire.request(APIConstants.GroupCategory, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
                .responseData { response in
                    
                    //print(response.error?.localizedDescription)
                    switch response.result {
                        
                    // 통신 성공
                    case .success:
                        if let value = response.result.value {
                            if let status = response.response?.statusCode {
                                
                                
                                switch status {
                                case 200:
                                    do {
                                        let decoder = JSONDecoder()
                                        
                                        // 데이터 encoding 하는 방법
                                        let result = try decoder.decode(ResponseArray<GroupCategory>.self, from: value)
                                        // print("finish decode")
                                        completion(.success(result))
                                        switch result.message {
                                        case "그룹 카테고리 조회 성공":
                                            completion(.success(result))
                                        case "invaild data":
                                            completion(.requestErr(result))
                                        default:
                                            break
                                        }
                                    } catch {
                                        completion(.pathErr)
                                        // print(error.localizedDescription)   // 에러 출력
                                        // debugPrint(error) // check which key is missing
                                    }
                                case 409:
                                    completion(.pathErr)
                                case 500:
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

