//
//  BookmarkService.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/02.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation
import Alamofire

struct BookmarkService {
    
    private init() {}
    
    static let shared = BookmarkService()
    
    func getBookmark(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let token = UserDefaults.standard
        let URL = APIConstants.BookmarkList
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
                                
                                let result = try
                                    decoder.decode(BookmarkList.self, from: value)
                                let data = result.data.categorys
                                completion(.success(data))
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
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }
 
    
}
