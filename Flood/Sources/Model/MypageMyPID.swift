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
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            postImages = (try? values.decode([String].self, forKey: .postImages)) ?? []
            see = (try? values.decode(Int.self, forKey: .see)) ?? 0
            bookmark = (try? values.decode(Int.self, forKey: .bookmark)) ?? 0
            comments = (try? values.decode([String].self, forKey: .comments)) ?? []
            score = (try? values.decode(Int.self, forKey: .score)) ?? 0
            commentsCount = (try? values.decode(Int.self, forKey: .commentsCount)) ?? 0
            bookmarkList = (try? values.decode([String].self, forKey: .bookmarkList)) ?? []
            postDate  = (try? values.decode(String.self, forKey: .postDate)) ?? ""
            id = (try? values.decode(String.self, forKey: .id)) ?? ""
            category = (try? values.decode(String.self, forKey: .category)) ?? ""
            image = (try? values.decode(String.self, forKey: .image)) ?? ""
            title = (try? values.decode(String.self, forKey: .title)) ?? ""
            pidArrDescription = (try? values.decode(String.self, forKey: .pidArrDescription)) ?? ""
            writer = (try? values.decode(String.self, forKey: .writer)) ?? ""
            writerEmail = (try? values.decode(String.self, forKey: .writerEmail)) ?? ""
            profileImage = (try? values.decode(String.self, forKey: .profileImage)) ?? ""
            postContent = (try? values.decode(String.self, forKey: .postContent)) ?? ""
            url = (try? values.decode(String.self, forKey: .url)) ?? ""
            groupCode = (try? values.decode(String.self, forKey: .groupCode)) ?? ""
            somethingElse = (try? values.decode(Int.self, forKey: .somethingElse)) ?? 0

    }
}

