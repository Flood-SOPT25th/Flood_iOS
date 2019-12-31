//
//  GroupCategory.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/31.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation

// MARK: - GroupCategory
struct GroupCategory: Codable {
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let category: [String]
}
