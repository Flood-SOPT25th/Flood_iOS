//
//  PostPid.swift
//  Flood
//
//  Created by hjyoo on 2019/12/30.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct PostPid: Codable {
    let message: String
    let data: pidArrs?
}

// MARK: - DataClass
struct pidArrs: Codable {
    let pidArr: [pidArr]
}

// MARK: - TopArr
struct pidArr: Codable {
    
    let postImages: [String]
    let see, bookmark: Int
    let score: Double
    let bookmarked: Bool
    let commentsCount: Int
    let bookmarkList: [String]
    let postDate, id: String
    let category : String
    let image: String
    let title, description, writer: String
    let profileImage: String
    let postTitle, postContent: String
    let url: String
    let groupCode: String
    let somethingElse: Int

    enum CodingKeys: String, CodingKey {
        case postImages, see, bookmark, bookmarked
        case bookmarkList = "bookmark_list"
        case score, postDate
        case id = "_id"
        case image, title, category
        case description
        case writer, profileImage
        case commentsCount = "comments_count"
        case postTitle, postContent, url, groupCode
        case somethingElse = "_somethingElse"
    }
}
