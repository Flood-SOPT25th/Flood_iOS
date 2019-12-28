//
//  Service.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/23.
//  Copyright © 2019 Junhyeon. All rights reserved.
//


// API WIKI
// https://github.com/Flood-SOPT25th/Flood-Server/wiki


struct APIConstants {
    
    static let base = "http://flooddocker-env.3gfczrrijh.ap-northeast-2.elasticbeanstalk.com"
    
    // MARK: - Main 피드 화면
    static let PostTop3 = base + "/post/top" // GET , Top3 피드 조회
    static let PostPid = base + "/post"                 // GET , 게시물 전체 피드
    static let PostHash = base + "/post/hash"           // GET , 게시물 전체 피드
    static let PostDetail = base + "/post/detail/:idx"  // GET , 해당 게시물 조회 및 조회수 증가
    
    // MARK: - 게시물 업로드
    static let PostUpload = base + "/post"              // POST , 업로드
    static let GroupCategory = base + "/group/category" // GET  , 그룹 카테고리 조회
    
    // MARK: - 회원 가입
    static let SignUp = base + "/auth/signup" // POST , 조직 생성
    static let SignIn = base + "/auth/signin" // POST , 그룹 카테고리 조회 , 로그인
    // 그룹 카테고리 조회 들어감
    static let Organization = base + "/auth/signup/organization" // POST , 조직 생성
    
    // MARK: - 북마크
    static let BookmarkList = base + "/post/bookmark" // GET , 북마크 리스트 조회
    static let BookmarkDetail = base + "/post/bookmark/detail" // GET , 해당 북마크된 리스트 조회
    static let BookmarkAdd = base + "/post/bookmark/add" // POST , 북마크 추가
    static let BookmarkCancle = base + "/post/bookmark/cancel" // POST , 북마크 삭제
    static let BookmarkModify = base + "/post/bookmark" // POST , 북마크 카테고리 추가 수정 삭제
   
 
}
