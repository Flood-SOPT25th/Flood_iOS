//
//  PostTop3Services.swift
//  Flood
//
//  Created by hjyoo on 2019/12/29.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation
import Alamofire

//(get)

class PostTop3Services {
    
    //다른 class에서 방해하는 것을 막아주는 구문
    private init() {}
    
    static let shared = PostTop3Services()
    
    // (completion: @escaping (enum으로선언한것<[Data첫번째구조체이름.두번째구조체이름], Error(swift타입)>) -> Void)
    func getPostTop3(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.PostTop3
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
                                let object = try decoder.decode(PostTop3.self, from: value as! Data)
                                
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

/*
 //데이터가 들어왔는지 아닌지: 데이터가 안 들어왔을 때(= nil 일때) else실행
 guard let data = response.data else { return }
 
 do{
 let decoder = JSONDecoder()
 
 let object = try decoder.decode(PostTop3.self, from: data)
 
 if object.success == true {
 print("성공")
 completion(.success(object.data))
 }
 else {
 completion(.requestErr(fatalError("서버이상")))
 }
 
 } catch(let err) {
 print(err.localizedDescription)
 completion(.pathErr)
 }
 
 case .failure(let err):
 print(err.localizedDescription)
 completion(.networkFail)
 break
 */
