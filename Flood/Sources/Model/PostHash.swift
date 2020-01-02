//
//  PostHash.swift
//  Flood
//
//  Created by hjyoo on 2019/12/30.
//  Copyright © 2019 Junhyeon. All rights reserved.
//
import Foundation

// MARK: - PostHash
struct PostHash: Codable {
    let message: String
    let data: HashData
}

// MARK: - DataClass
struct HashData: Codable {
    let pidArr: [PIDArr]
}

// MARK: - PIDArr
struct PIDArr: Codable {
    let postImages: [String]
    let see, bookmark: Int
    let bookmarked: Bool
    let bookmarkList: [String]
    let score: Double
    let postDate, id: String
    let image: String
    let title, pidArrDescription, writer: String
    let profileImage: String
    let commentsCount: Int
    let postContent: String
    let url: String
    let groupCode: String
    let somethingElse: Int

    enum CodingKeys: String, CodingKey {
        case postImages, see, bookmark, bookmarked
        case bookmarkList = "bookmark_list"
        case score, postDate
        case id = "_id"
        case image, title
        case pidArrDescription = "description"
        case writer, profileImage
        case commentsCount = "comments_count"
        case postContent, url, groupCode
        case somethingElse = "_somethingElse"
    }
}

