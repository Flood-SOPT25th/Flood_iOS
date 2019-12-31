//
//  PostUpload.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/31.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import Foundation

// MARK: - PostUpload
struct PostUpload: Codable {
    let images: [String]
    let url: String
    let category, postContent: String
}
