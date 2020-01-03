//
//  MypageMyPID.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/03.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation

// MARK: - MypageMy
struct MypageMyPID: Codable {
    let message: String
    let data: PidData
}

// MARK: - DataClass
struct PidData: Codable {
    let pidArr: [PIDArray]
}

// MARK: - PIDArr
struct PIDArray: Codable {
    let postImages: [String]
    let see, bookmark, score, commentsCount: Int
    let bookmarkList: [String]
    let postDate: String
    let comments: [String]
    let id: String
    let image: String
    let title, pidArrDescription, groupCode, category: String
    let writer, writerEmail, postContent: String
    let profileImage: String
    let url: String
    let somethingElse: Int

    enum CodingKeys: String, CodingKey {
        case postImages, see, bookmark, score
        case commentsCount = "comments_count"
        case bookmarkList = "bookmark_list"
        case postDate, comments
        case id = "_id"
        case image, title
        case pidArrDescription = "description"
        case groupCode, category, writer
        case writerEmail = "writer_email"
        case postContent, profileImage, url
        case somethingElse = "_somethingElse"
    }
}

