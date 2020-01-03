//
//  PostPid.swift
//  Flood
//
//  Created by hjyoo on 2019/12/30.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation

// MARK: - PostPid
struct PostPid : Decodable { 
    let message: String
    let data: PostPid2?
}

// MARK: - PostPid2
struct PostPid2: Codable {
    let pidArr: [pidArr]
}

// MARK: - PidArr
struct pidArr: Codable {
    
    let postImages: [String]
    let see, bookmark: Int
    let score: Double
    let bookmarked: Bool
    let commentsCount: Int
    let bookmarkList: [String?]
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
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        postImages = (try? values.decode([String].self, forKey: .postImages)) ?? []
        see = (try? values.decode(Int.self, forKey: .see)) ?? 0
        bookmark = (try? values.decode(Int.self, forKey: .bookmark)) ?? 0
        score = (try? values.decode(Double.self, forKey: .score)) ?? 0.0
        bookmarked = (try? values.decode(Bool.self, forKey: .bookmarked)) ?? false
        commentsCount = (try? values.decode(Int.self, forKey: .commentsCount)) ?? 0
        bookmarkList = (try? values.decode([String].self, forKey: .bookmarkList)) ?? []
        postDate  = (try? values.decode(String.self, forKey: .postDate)) ?? ""
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
        category = (try? values.decode(String.self, forKey: .category)) ?? ""
        image = (try? values.decode(String.self, forKey: .image)) ?? ""
        title = (try? values.decode(String.self, forKey: .title)) ?? ""
        description = (try? values.decode(String.self, forKey: .description)) ?? ""
        writer = (try? values.decode(String.self, forKey: .writer)) ?? ""
        profileImage = (try? values.decode(String.self, forKey: .profileImage)) ?? ""
        postTitle = (try? values.decode(String.self, forKey: .postTitle)) ?? ""
        postContent = (try? values.decode(String.self, forKey: .postContent)) ?? ""
        url = (try? values.decode(String.self, forKey: .url)) ?? ""
        groupCode = (try? values.decode(String.self, forKey: .groupCode)) ?? ""
        somethingElse = (try? values.decode(Int.self, forKey: .somethingElse)) ?? 0
    
    }
}
/*
extension PostPid: Decodable {
    // This struct stays very close to the JSON model, to the point
    // of using snake_case for its properties. Since it's private,
    // outside code cannot access it (and no need to either)
    private struct JSONSettings: Decodable {
        var enabled: String
    }

    private enum CodingKeys: String, CodingKey {
        case settings
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let settings  = try container.decode(JSONSettings.self, forKey: .settings)
        isEnabled     = settings.enabled == "1" ? true : false
    }
}
*/
