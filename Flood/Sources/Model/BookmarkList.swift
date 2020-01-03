//
//  BookmarkList.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/02.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation

// MARK: - BookmarkList
struct BookmarkList: Codable {
    let message: String
    let data : CategoryArr
}

// MARK: - DataClass
struct CategoryArr: Codable {
    let categorys: [Category]
}

// MARK: - Categorys
struct Category: Codable {
    let categoryName: String
    let thumb: String
    let count: Int
    let categoryID: String?

    enum CodingKeys: String, CodingKey {
        case categoryName, thumb, count
        case categoryID = "category_id"
    }
}
