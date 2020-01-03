//
//  PostTop3.swift
//  Flood
//
//  Created by hjyoo on 2019/12/29.
//  Copyright © 2019 Junhyeon. All rights reserved.
//
/*
 import Foundation

 struct PostTop3: Codable {
     
     let message: String
     let data: topArrs?
 }

 struct topArrs: Codable
     let topArrs: [topArr]
 }

 struct topArr: Codable {
     
     let postImages : [String]
     let postDate, id, image, title, description, writer, profileImage, postContent, url, groupCode : String
     let see, bookmark ,commentsCount, somethingElse : Int
     let bookmarked : Bool
     let bookmarkList : [String]
     let score : Double
     
     
      // JSON에 '_(언더바)'가 있을 경우: 언더바를 없애주는 작업('_'를 좋아하지않기때문)
     enum CodingKeys : String, CodingKey {
         case postImages, postDate, image, title, description, writer, profileImage, postContent, url, groupCode
         case see, bookmark, score
         case bookmarked
         case bookmarkList = "bookmark_list"
         case id = "_id"
         case commentsCount = "comments_count"
         case somethingElse = "_somethingElse"
     }
      
 }

 */

import Foundation

// MARK: - Welcome
struct PostTop3: Codable {
    let message: String
    let data: topArrs?
}

// MARK: - DataClass
struct topArrs: Codable {
    let topArr: [topArr]
}

// MARK: - TopArr
struct topArr: Codable {
    
    let postImages: [String]
    let see, bookmark: Int
    let bookmarked: Bool
    let bookmarkList: [String]
    let score: Double
    let postDate, id: String
    let image: String
    let title, description, writer: String
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
        case description
        case writer, profileImage
        case commentsCount = "comments_count"
        case postContent, url, groupCode
        case somethingElse = "_somethingElse"
    }
}


