//
//  PostPidServices.swift
//  Flood
//
//  Created by hjyoo on 2019/12/30.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation
import Alamofire

//(get)

class PostPidServices {
    
    //다른 class에서 방해하는 것을 막아주는 구문
    private init() {}
    
    static let shared = PostPidServices()
    
    //(completion: @escaping (enum으로선언한것<[Data첫번째구조체이름.두번째구조체이름], Error(swift타입)>) -> Void)
    func getPostPid(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.PostPid
        let headers: [String: String] = [
            "Content-Type": "application/json",
            "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVoZGduczE3NjZAZ21haWwuY29tIiwibmFtZSI6IuydtOuPme2biCIsImlhdCI6MTU3NzQwNzg1NiwiZXhwIjoxNTc5OTk5ODU2LCJpc3MiOiJGbG9vZFNlcnZlciJ9.Zf_LNfQIEdFl84r-tPQpT1nLaxdotkFutOxwNQy-w58"
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
}
