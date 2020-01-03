//
//  MypageMyPID.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/03.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation

// MARK: - MypageMyPID
struct MypageMyPID : Codable {
    let message: String
    let data: PidData
}

// MARK: - DataClass
struct PidData : Codable {
    let pidArr: [PIDArray]
}

// MARK: - PIDArr
struct PIDArray : Codable {
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
}
