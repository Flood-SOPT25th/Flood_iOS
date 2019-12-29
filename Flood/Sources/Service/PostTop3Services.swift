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
/*
class PostTop3Services {
    
<<<<<<< Updated upstream
    //다른 class에서 방해하는 것을 막아주는 구문
    private init() {}
    
    static let shared = PostTop3Services()

    
    //(completion: @escaping (enum으로선언한것<[Data첫번째구조체이름.두번째구조체이름], Error(swift타입)>) -> Void)
    func getPostTop3(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.PostTop3
        Alamofire.request(URL).responseJSON {
            response in
            
            switch response.result {
                
            case .success:
                
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
            }
        }
    }
=======
//    //다른 class에서 방해하는 것을 막아주는 구문
//    private init() {}
//    
//    static let shared = PostTop3Services()
//
//    
//    //(completion: @escaping (enum으로선언한것<[Data첫번째구조체이름.두번째구조체이름], Error(swift타입)>) -> Void)
//    func getPostTop3(completion: @escaping (NetworkResult<Any>) -> Void) {
//        
//        let URL = APIConstants.PostTop3
//        Alamofire.request(URL).responseJSON {
//            response in
//            
//            switch response.result {
//                
//            case .success:
//                
//                //데이터가 들어왔는지 아닌지: 데이터가 안 들어왔을 때(= nil 일때) else실행
//                guard let data = response.data else { return }
//                
//                do{
//                    let decoder = JSONDecoder()
//                    
////                    let object = try decoder.decode(MainArticle.self, from: data)
//                    
//                    if object.success == true {
//                        print("성공")
//                        completion(.success(object.data))
//                    }
//                    else {
//                        completion(.requestErr(fatalError("서버이상")))
//                    }
//
//                } catch(let err) {
//                    print(err.localizedDescription)
//                    completion(.pathErr)
//                }
//            
//            case .failure(let err):
//                print(err.localizedDescription)
//                completion(.networkFail)
//                break
//            }
//        }
//    }
>>>>>>> Stashed changes
}
*/
