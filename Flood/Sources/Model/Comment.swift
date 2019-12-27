//
//  Comment.swift
//  Flood
//
//  Created by hjyoo on 2019/12/27.
//  Copyright © 2019 Junhyeon. All rights reserved.
//
// 댓글 데이터 
import Foundation

struct Comment {
  
  enum ChatType {
    case myChat
    case otherChat
  }
  
  var type: ChatType
  var message: String
  
}
