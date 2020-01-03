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
    
    static let BaseURL = "http://flooddocker-env.3gfczrrijh.ap-northeast-2.elasticbeanstalk.com"
    
    // MARK: - Main 피드 화면
    static let PostTop3 = BaseURL + "/post/top"                        // GET , Top3 피드 조회
    static let PostPid = BaseURL + "/post"                             // GET , 게시물 전체 피드
    static let PostHash = BaseURL + "/post/hash"                       // GET , 게시물 전체 피드
    static let PostDetail = BaseURL + "/post/detail/:idx"              // GET , 해당 게시물 조회 및 조회수 증가
    
    // MARK: - 게시물 업로드
    static let PostUpload = BaseURL + "/post"                          // POST , 업로드
    static let GroupCategory = BaseURL + "/group/category"             // GET  , 그룹 카테고리 조회
    
    // MARK: - 회원 가입
    static let SignUp = BaseURL + "/auth/signup"                       // POST , 조직 생성
    static let SignIn = BaseURL + "/auth/signin"                       // POST , 그룹 카테고리 조회 , 로그인
                                // 그룹 카테고리 조회 들어감
    static let Organization = BaseURL + "/auth/signup/organization"    // POST , 조직 생성
    
    // MARK: - 북마크
    static let BookmarkList = BaseURL + "/post/bookmark"               // GET , 북마크 리스트 조회
    static let BookmarkDetail = BaseURL + "/post/bookmark/detail"      // GET , 해당 북마크된 리스트 조회
    static let BookmarkAdd = BaseURL + "/post/bookmark/add"            // POST , 북마크 추가
    static let BookmarkCancle = BaseURL + "/post/bookmark/cancel"      // POST , 북마크 삭제
    static let BookmarkModify = BaseURL + "/post/bookmark"             // POST , 북마크 카테고리 추가 수정 삭제
    
    // MARK: - 마이페이지 , 메인
    static let MyPageMainInfo = BaseURL + "/mypage/main"               // GET , 마이페이지 유저 정보
    static let MyPageMyPid = BaseURL + "/post/me"                      // GET , 내가 쓴 글 조회
    
    // MARK: - 마이페이지 , 프로필 수정
    static let MyPageSettingMain = BaseURL + "/mypage/setting"         // GET , 마이페이지 프로필설정 기본화면
    static let MyPageSettingInfo = BaseURL + "/mypage/setting"         // PUT , 마이페이지 프로필설정 변경
    static let MypageSettingImage = BaseURL + "/mypage/setting/image"  // PUT , 마이페이지 프로필설정 사진 변경
    static let MypageSettingPW = BaseURL + "/mypage/setting/password"  // PUT , 마이페이지 프로필설정 비밀번호 변경
     
    // MARK: - 마이페이지, 조직설정
    static let MemberSettingMain = BaseURL + "/mypage/member"          // GET , 조직설정 기본화면
    static let MemberSettingAdd = BaseURL + "/mypage/member/add"       // PUT , 조직설정 Admin 계정추가
    static let MemberSettingDelete = BaseURL + "/mypage/member/delete" // PUT , 조직설정 계정삭제

}
