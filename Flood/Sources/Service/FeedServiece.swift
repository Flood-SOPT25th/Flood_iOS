//
//  FeedServiece.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/01.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation
import Alamofire

struct FeedService {
    
    private init() {}
    
    static let shared = FeedService()
    
    // (completion: @escaping (enum으로선언한것<[Data첫번째구조체이름.두번째구조체이름], Error(swift타입)>) -> Void)
    func getPostTop3(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let token = UserDefaults.standard
        let URL = APIConstants.PostTop3
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization" : "\(token.string(forKey: "Authorization")!)"
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData {
            response in
            
            switch response.result {
                
            case .success:
                // parameter 위치
                if let value = response.result.value {
                    //response의 respones안에 있는 statusCode를 추출
                    if let status = response.response?.statusCode {
                        
                        switch status {
                        case 200:
                            do{
                                //decoding 시작
                                let decoder = JSONDecoder()
                                let object = try decoder.decode(PostTop3.self, from: value)
                                
                                if let data = object.data {
                                    
                                    completion(.success(data.topArr))
                                }
                                    
                                else {
                                    completion(.requestErr(object.message))
                                }
                                
                            } catch (let err) {
                                print(err.localizedDescription)
                                completion(.pathErr)
                            }
                            
                        case 400:
                            print("failure")
                            
                        default:
                            break
                        }
                    }
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }
    
    //(completion: @escaping (enum으로선언한것<[Data첫번째구조체이름.두번째구조체이름], Error(swift타입)>) -> Void)
    func getPostPid(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let token = UserDefaults.standard
        let URL = APIConstants.PostPid
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization" : "\(token.string(forKey: "Authorization")!)"
        ]
        /*
         let query: Parameters = [
         "page" : 0, "limit" : 10 ]
         */
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData{
            response in
            
            switch response.result {
                
            case .success:
                // parameter 위치
                if let value = response.result.value {
                    //print("response", )
                    print("value", value)
                    //response의 respones안에 있는 statusCode를 추출
                    if let status = response.response?.statusCode {
                        print(status)
                        switch status {
                        case 200:
                            do{
                                print("start decode")
                                let decoder = JSONDecoder()
                                
                                // 데이터 encoding 하는 방법
                                print("data", String(data:value, encoding: .utf8))
                                
                                let object = try decoder.decode(PostPid.self, from: value)
                                
                                if let data = object.data {
                                    
                                    completion(.success(data.pidArr))
                                }
                                    
                                else {
                                    completion(.requestErr(object.message))
                                }
                                
                            } catch let DecodingError.dataCorrupted(context) {
                                print(context)
                            } catch let DecodingError.keyNotFound(key, context) {
                                print("Key '\(key)' not found:", context.debugDescription)
                                print("codingPath:", context.codingPath)
                            } catch let DecodingError.valueNotFound(value, context) {
                                print("Value '\(value)' not found:", context.debugDescription)
                                print("codingPath:", context.codingPath)
                            } catch let DecodingError.typeMismatch(type, context)  {
                                print("Type '\(type)' mismatch:", context.debugDescription)
                                print("codingPath:", context.codingPath)
                            } catch {
                                print("error: ", error)
                            }
                            
                        case 400:
                            print("failure")
                            
                        default:
                            break
                        }
                    }
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }
    
    func getPostHash(_ category: String, completion: @escaping (NetworkResult<Any>) -> Void) {
            let token = UserDefaults.standard
            let URL = APIConstants.PostHash
            let headers: HTTPHeaders = [
                "Content-Type": "application/json",
                "Authorization" : "\(token.string(forKey: "Authorization")!)"
            ]
            
            
        Alamofire.request(URL, method: .get, parameters: ["category" : category], encoding: JSONEncoding.default, headers: headers).responseData{
                response in
    
                switch response.result {
    
                case .success:
                    // parameter 위치
                    if let value = response.result.value {
                        //print("response", )
                         print("value", value)
                        //response의 respones안에 있는 statusCode를 추출
                        if let status = response.response?.statusCode {
                            print(status)
                            switch status {
                            case 200:
                                do{
                                    print("start decode")
                                    let decoder = JSONDecoder()
    
                                        let result = try
                                            decoder.decode(BookmarkList.self, from: value)
                                        // print("finish decode")
                                        completion(.success(result))
                                        print("성공성공")
                                        print("value", result.data.categorys)
                                        
                                        switch result.message {
                                            
                                        case "해당 해쉬 피드 조회 성공":
                                            completion(.success(result))
                                            
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
                                print("failure")
    
                            case 500:
                                print("failure")
                                
                            default:
                                break
                            }
                        }
                    }
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                }
            }
    
        }
    
}
