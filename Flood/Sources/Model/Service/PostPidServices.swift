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
        Alamofire.request(URL).responseJSON {
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
                                let object = try decoder.decode(PostPid.self, from: value as! Data)
                                
                                if object.data != nil {
            
                                    completion(.success(object.data))
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
}
