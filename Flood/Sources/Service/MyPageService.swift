//
//  MyPageService.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/03.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation
import Alamofire

struct MyPageSerivce {
    
    private init() {}
    
    static let shared = MyPageSerivce()
    
    // MARK: - MyPageMyPost
    
    func MyPageMyPost(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let token = UserDefaults.standard
        let URL = APIConstants.MyPageMyPid
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization" : "\(token.string(forKey: "Authorization")!)"
        ]
        
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
                                print("mypost in service : ", String(data:value, encoding: .utf8))
                                let result = try decoder.decode(MypageMyPID.self, from: value)
                                print("mypost in service result : ", String(data: value, encoding: .utf8))
                                completion(.success(result.data.pidArr))
                            } catch {
                                completion(.pathErr)
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
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }
    
    // MARK: - MypageInfo
    
    func MypageInfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let token = UserDefaults.standard
        let URL = APIConstants.MyPageMainInfo
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization" : "\(token.string(forKey: "Authorization")!)"
        ]
        
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
                                print("info in service : ", String(data:value, encoding: .utf8))
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(MypageMainInfo.self, from: value)
                                let infoData = result.data.userInfo
                                completion(.success(infoData))
                            } catch {
                                completion(.pathErr)
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
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }

}
