//
//  ResponseArray.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/31.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation

struct ResponseArray<T: Codable>: Codable  {
    let status: Int
    let success: Bool
    let message: String
    let data: [T]?
}
