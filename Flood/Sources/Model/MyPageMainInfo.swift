//
//  MyPageMainInfo.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/03.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation

// MARK: - MypageMainInfo
struct MypageMainInfo : Codable {
    let message: String
    let data: InfoData
}

// MARK: - InfoData
struct InfoData : Codable {
    let userInfo: UserInfo
}

// MARK: - UserInfo
struct UserInfo : Codable {
    let name: String
    let profileImage: String
    let rank, groupName, groupDepartment: String
    let count: Int
}
