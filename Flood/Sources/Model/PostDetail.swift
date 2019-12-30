//
//  PostDetail.swift
//  Flood
//
//  Created by hjyoo on 2019/12/30.
//  Copyright © 2019 Junhyeon. All rights reserved.
//
/*
 {
 "message": "해당 포스트 조회 성공",
 "data": {
 "pidArr": {
 "postImages": [
 "https://flood-master.s3.ap-northeast-2.amazonaws.com/1577096580808.jpg"
 ],
 "see": 13,
 "bookmark": 1,
 "score": 4,
 "comments_count": 2,
 "postDate": "2019-12-23T10:22:52.915Z",
 "comments": [
 {
 "subComment": [
 {
 "subComment": [],
 "comment_date": "2019-12-26T10:58:09.086Z",
 "_id": "5e0492ca9777af39230d08f7",
 "content": "나는 나는 이동훈",
 "writer": "이동훈",
 "profileImage": "https://flood-master.s3.ap-northeast-2.amazonaws.com/1577162793500.jpg"
 },
 {
 "subComment": [],
 "comment_date": "2019-12-26T17:25:47.123Z",
 "_id": "5e04efc2fa069c00129ddfe1",
 "content": "나는 나는 이동훈",
 "writer": "이동훈",
 "profileImage": "https://flood-master.s3.ap-northeast-2.amazonaws.com/1577162793500.jpg"
 },
 {
 "subComment": [],
 "comment_date": "2019-12-26T17:35:42.798Z",
 "_id": "5e04efc814841a0012c697e4",
 "content": "나는 나는 이동훈",
 "writer": "이동훈",
 "profileImage": "https://flood-master.s3.ap-northeast-2.amazonaws.com/1577162793500.jpg"
 }
 ],
 "comment_date": "2019-12-26T10:07:44.612Z",
 "_id": "5e04867432c9dc382f481536",
 "content": "나는 나는 이동훈",
 "writer": "이동훈",
 "profileImage": "https://flood-master.s3.ap-northeast-2.amazonaws.com/1577162793500.jpg"
 "__v": 7
 }
 ],
 "_id": "5e009585beecc40d80a4c835",
 "category": "it",
 "image": "https://imgnews.pstatic.net/image/079/2019/12/23/0003304759_001_20191223163702507.jpg",
 "title": "\"국과수 감정 조작\" 檢, 이춘재 8차 재심 개시 의견 제출",
 "description": "[CBS노컷뉴스 고무성 기자] 검찰이 이춘재 연쇄살인 8차 사건에 대해 재심을 개시함이 상당하다는 의견서를 법원에 제출했다. 수원지검 이 사건 전담조사팀은 23일 오후 브리핑을 통해 \"재심청구인 윤모(52) 씨에 대",
 "writer": "ehdgns1766",
 "comments_count": 3,
 "profileImage": "https://flood-master.s3.ap-northeast-2.amazonaws.com/1577162793500.jpg",
 "postContent": "요",
 "url": "https://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=102&oid=079&aid=0003304759",
 "groupCode": "suk5b5e047712",
 "_somethingElse": 13
 }
 }
 }
 */
import Foundation

struct PostDetail: Codable {
    
    let message: String
    let data: [pidArr2]?
}

struct pidArr2: Codable {
    
    let postImages, postDate, id, image, title, description, writer, profileImage, url, groupCode : String
    let see, bookmark ,comments_count, somethingElse : Int
    let bookmarked : Bool
    let bookmarkList : String
    let score : Double
    let postContent : String
    let comments : [subComment]?
}

struct subComment: Codable {
    
    let comment_date, _id, content, writer, profileImage : String
}
