//
//  NetworkResult.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/28.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
