//
//  ViewController.swift
//  Flood
//
//  Created by hjyoo on 2020/01/02.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyGif

class ViewController: UIViewController {
    
    // MARK: - UI components
    @IBOutlet weak var FeedTV: UITableView!
    //@IBOutlet weak var CatagorysCV: UICollectionView!
    
    // MARK: - Variables and Properties
    
    var selectedCategory: Int = 0
    
    var Categorydataset : GroupCategory!
    var CategoryList : categoryData?
    var CategoryViewList : [String] = []
    var PostTop3dataset : PostTop3!
    var top3List : [topArr] = []
    var PostPiddataset : PostPid!
    var PidList : [pidArr] = []
    // 카테고리 선택시 변경을 위한 기사 배열
    var choosePidList : [pidArr] = []
    var bookmarkList : [Category] = []
    var hostList : [PIDArr] = []
    var checkBookmark : [Bool] = []
    
    let logoAnimationView = LogoAnimationView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedTV.delegate = self
        FeedTV.dataSource = self
        //CatagorysCV.delegate = self
        //CatagorysCV.dataSource = self
        
        initSetting()
        
        // 서버 통신
        setTop3()
        setPostPid()
        setCategroyBar()
        getBookmark()
        
        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.hidesBottomBarWhenPushed = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
        logoAnimationView.logoGifImageView.startAnimatingGif()
        //        logoAnimationView.layer.zPosition = 999
        self.tabBarController?.tabBar.layer.zPosition = -100
        setTop3()
        setPostPid()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 이 부분은 아래 부분의 didSelectRowAt 부분을 먼저 읽고 다시 와주세요!
        
        /*
         didSelectRowAt 함수에서 해당 셀을 선택하고 음악 상세정보 뷰로 전환되었다가 다시 돌아오면
         그 셀이 선택된 상태로 남아 있는 현상을 해결합니다. (궁금하다면 이 부분을 주석처리하고 실행해보세요!)
         viewDidDisappear 안에 선언되어 뷰가 다시 나타날 때 아래 코드가 실행되고
         현재 선택된 row 의 인덱스를 가져와 그 인덱스에 해당하는 row 를 이용해 deslect 를 해줍니다.
         */
        
        if let index = FeedTV.indexPathForSelectedRow {
            FeedTV.deselectRow(at: index, animated: true)
        }
        
    }
    
    // MARK: -Helpers
    
    func initSetting() {
        //tableviewcell 왼쪽라인 채우기
        FeedTV.separatorInset.left = 0
        FeedTV.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        // 네비게이션 바 배경색 설정 및 경계선 없애는 설정
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        // 탭바 배경색 설정
        self.tabBarController?.tabBar.backgroundColor = .white
        self.tabBarController?.tabBar.isTranslucent = false
        
        
    }
    
    @IBAction func webConncet(_ sender: UIButton) {
        guard let url = URL(string: "https://www.google.com"),
            UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func NavigateDetailVC(_ sender: UIButton) {
        let NSPostDetailView = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewsSharePostDetailView") as? NewsSharePostDetailView
        self.navigationController?.pushViewController(NSPostDetailView!, animated: true)
    }
    
    
    @IBAction func popupAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "PopupViewController") as! PopupViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.bookmarkList = bookmarkList
        
        if let tbc = self.tabBarController {
            tbc.present(vc, animated: true)
        }
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1{
            return 1
        }
        else if section == 2 {
            return top3List.count
        }
        else if section == 3 {
            return 1
        }
        else {
            return PidList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let maincategoryCell = FeedTV.dequeueReusableCell(withIdentifier: "MainCatarogyCell", for: indexPath) as! MainCatarogyCell
                FeedTV.separatorStyle = UITableViewCell.SeparatorStyle.none
                maincategoryCell.Categorydata = CategoryViewList
                
                return maincategoryCell
            }
        }
            
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let sectionHeaderCell = FeedTV.dequeueReusableCell(withIdentifier: "SectionHeaderCell", for: indexPath) as! SectionHeaderCell
                sectionHeaderCell.day.isHidden = false
                sectionHeaderCell.title.isHidden = false
                sectionHeaderCell.subtitle.isHidden = false
                sectionHeaderCell.decorationImg.isHidden = true
                sectionHeaderCell.day.text = "2nd decem"
                sectionHeaderCell.title.text = "This Week"
                sectionHeaderCell.subtitle.text = "Top3"
            }
        }
            
        else if indexPath.section == 2 {
            if (indexPath.row == 0) {
                let top3post = top3List[indexPath.row]
                let thisweekCell = FeedTV.dequeueReusableCell(withIdentifier: "ThisWeekCell", for: indexPath) as! ThisWeekCell
                thisweekCell.thisweekImg.imageFromUrl(top3post.image, defaultImgPath : "http:// ~~ ")
                thisweekCell.thisweekTitle.text = top3post.title
                thisweekCell.thisweekTitle.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                thisweekCell.thisweekTitle.textColor = .white
                thisweekCell.thisweekflipCount.text = "Flips \((top3post.bookmark)) Comments \((top3post.commentsCount))"
                thisweekCell.thisweekflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                thisweekCell.thisweekflipCount.textColor = .white
                thisweekCell.thisweekMore.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                thisweekCell.thisweekBookmark.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                thisweekCell.thisweekprofileImg.imageFromUrl(top3post.profileImage, defaultImgPath : "http:// ~~ ")
                thisweekCell.thisweekprofileImg.layer.cornerRadius = 10
                thisweekCell.thisweekName.text = top3post.writer
                thisweekCell.thisweekName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                thisweekCell.thisweekTime.text = top3post.postDate
                thisweekCell.thisweekTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                thisweekCell.thisweekTime.textColor = .veryLightPink
                thisweekCell.thisweekPost.text = top3post.postContent
                thisweekCell.thisweekPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                
                return thisweekCell
            }
            else if (indexPath.row == 1) {
                let top3post = top3List[indexPath.row]
                let thisweekCell = FeedTV.dequeueReusableCell(withIdentifier: "ThisWeekCell", for: indexPath) as! ThisWeekCell
                thisweekCell.thisweekImg.imageFromUrl(top3post.image, defaultImgPath : "http:// ~~ ")
                thisweekCell.thisweekTitle.text = top3post.title
                thisweekCell.thisweekTitle.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                thisweekCell.thisweekTitle.textColor = .white
                thisweekCell.thisweekflipCount.text = "Flips \((top3post.bookmark)) Comments \((top3post.commentsCount))"
                thisweekCell.thisweekflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                thisweekCell.thisweekflipCount.textColor = .white
                thisweekCell.thisweekMore.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                thisweekCell.thisweekBookmark.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                thisweekCell.thisweekprofileImg.imageFromUrl(top3post.profileImage, defaultImgPath : "http:// ~~ ")
                thisweekCell.thisweekprofileImg.layer.cornerRadius = 10
                thisweekCell.thisweekName.text = top3post.writer
                thisweekCell.thisweekName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                thisweekCell.thisweekTime.text = top3post.postDate
                thisweekCell.thisweekTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                thisweekCell.thisweekTime.textColor = .veryLightPink
                thisweekCell.thisweekPost.text = top3post.postContent
                thisweekCell.thisweekPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                
                return thisweekCell
                
            }
            else if (indexPath.row == 2) {
                let top3post = top3List[indexPath.row]
                let thisweekCell = FeedTV.dequeueReusableCell(withIdentifier: "ThisWeekCell", for: indexPath) as! ThisWeekCell
                thisweekCell.thisweekImg.imageFromUrl(top3post.image, defaultImgPath : "http:// ~~ ")
                thisweekCell.thisweekTitle.text = top3post.title
                thisweekCell.thisweekTitle.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                thisweekCell.thisweekTitle.textColor = .white
                thisweekCell.thisweekflipCount.text = "Flips \((top3post.bookmark)) Comments \((top3post.commentsCount))"
                thisweekCell.thisweekflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                thisweekCell.thisweekflipCount.textColor = .white
                thisweekCell.thisweekMore.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                thisweekCell.thisweekBookmark.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                thisweekCell.thisweekprofileImg.imageFromUrl(top3post.profileImage, defaultImgPath : "http:// ~~ ")
                thisweekCell.thisweekprofileImg.layer.cornerRadius = 10
                thisweekCell.thisweekName.text = top3post.writer
                thisweekCell.thisweekName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                thisweekCell.thisweekTime.text = top3post.postDate
                thisweekCell.thisweekTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                thisweekCell.thisweekTime.textColor = .veryLightPink
                thisweekCell.thisweekPost.text = top3post.postContent
                thisweekCell.thisweekPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                
                return thisweekCell
                
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0 {
                let sectionHeaderCell = FeedTV.dequeueReusableCell(withIdentifier: "SectionHeaderCell", for: indexPath) as! SectionHeaderCell
                sectionHeaderCell.day.isHidden = true
                sectionHeaderCell.title.isHidden = false
                sectionHeaderCell.subtitle.isHidden = true
                sectionHeaderCell.decorationImg.isHidden = false
                sectionHeaderCell.title.text = "Today"
                sectionHeaderCell.decorationImg.image = UIImage(named: "24")
                return sectionHeaderCell
            }
        }
        else {
            let pidpost = PidList[indexPath.row]
            let picturepostCell = FeedTV.dequeueReusableCell(withIdentifier: "PicturePostCell", for: indexPath) as! PicturePostCell
            
            // 게시글과 게시사진 유무
            if pidpost.postContent == "" && pidpost.postImages == []    {
                picturepostCell.postpostView.isHidden = true
                picturepostCell.picturepostView.isHidden = true
                //picturepostCell.newsshareView.isHidden = false
            }
            else if pidpost.postContent != "" && pidpost.postImages == []   {
                picturepostCell.postpostView.isHidden = false
                picturepostCell.picturepostView.isHidden = true
                //picturepostCell.newsshareView.isHidden = false
            }
            else if pidpost.postContent == "" && pidpost.postImages != []  {
                picturepostCell.postpostView.isHidden = true
                picturepostCell.picturepostView.isHidden = false
                //picturepostCell.newsshareView.isHidden = false
            }
            else {
                picturepostCell.postpostView.isHidden = false
                picturepostCell.picturepostView.isHidden = false
                //picturepostCell.newsshareView.isHidden = false
            }
            
            // url에 따른 뉴스기사 유무
            if pidpost.url == "" {
                if pidpost.postTitle == "" {
                    picturepostCell.newtitleView.isHidden = true
                    if pidpost.description == "" {
                        picturepostCell.newsshareView.isHidden = true
                        if pidpost.image == "" {
                            picturepostCell.newsImg?.isHidden = true
                        }
                        else{
                            picturepostCell.newsImg.isHidden = false
                        }
                    }
                    else {
                        picturepostCell.newsshareView.isHidden = false
                        if pidpost.image == "" {
                            picturepostCell.newsImg.isHidden = true
                        }
                        else{
                            picturepostCell.newsImg.isHidden = false
                        }
                    }
                }
                else {
                    picturepostCell.newtitleView.isHidden = true
                    if pidpost.description == "" {
                        picturepostCell.newsshareView.isHidden = true
                        if pidpost.image == "" {
                            picturepostCell.newsImg.isHidden = true
                        }
                        else{
                            picturepostCell.newsImg.isHidden = false
                        }
                    }
                    else {
                        picturepostCell.newsshareView.isHidden = false
                        if pidpost.image == "" {
                            picturepostCell.newsImg.isHidden = true
                        }
                        else{
                            picturepostCell.newsImg.isHidden = false
                        }
                    }
                }
            }
            else {
                picturepostCell.newsshareView.isHidden = true
            }
            
            
            if pidpost.postContent == "" && pidpost.postImages == []    {
                picturepostCell.postpostView.isHidden = true
                picturepostCell.picturepostView.isHidden = true
                //picturepostCell.newsshareView.isHidden = false
            }
            else if pidpost.postContent != "" && pidpost.postImages == []   {
                picturepostCell.postpostView.isHidden = false
                picturepostCell.picturepostView.isHidden = true
                //picturepostCell.newsshareView.isHidden = false
            }
            else if pidpost.postContent == "" && pidpost.postImages != []  {
                picturepostCell.postpostView.isHidden = true
                picturepostCell.picturepostView.isHidden = false
                //picturepostCell.newsshareView.isHidden = false
            }
                // 둘 다 있을 때
            else {
                picturepostCell.postpostView.isHidden = false
                picturepostCell.picturepostView.isHidden = false
                //picturepostCell.newsshareView.isHidden = false
            }
            
            picturepostCell.picturepostCatagory?.text = pidpost.category
            picturepostCell.picturepostCatagory?.font = UIFont.systemFont(ofSize: CGFloat(12))
            picturepostCell.picturepostCatagory?.textColor = .electricBlue
            picturepostCell.picturepostCatagoryView?.layer.borderWidth = 1
            picturepostCell.picturepostCatagoryView?.layer.borderColor = UIColor.electricBlue.cgColor
            picturepostCell.picturepostCatagoryView?.setRounded(radius: 11)
            picturepostCell.picturepostprofileImg?.imageFromUrl(pidpost.profileImage, defaultImgPath : "http:// ~~ ")
            picturepostCell.picturepostprofileImg?.layer.cornerRadius = 10
            picturepostCell.picturepostName?.text = pidpost.writer
            picturepostCell.picturepostName?.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
            picturepostCell.picturepostTime?.text = pidpost.postDate
            picturepostCell.picturepostTime?.font = UIFont.systemFont(ofSize: CGFloat(12))
            picturepostCell.picturepostTime?.textColor = .veryLightPink
            picturepostCell.picturepostPost?.text = pidpost.postContent
            picturepostCell.picturepostPost?.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
            picturepostCell.picturepostMore?.setImage(UIImage(named: "icMoreGray"), for: .normal)
            
            
            //사진분기처리?
            if pidpost.postImages.count == 0 {
                picturepostCell.picturepostView.isHidden = true
            } else if pidpost.postImages.count == 1 {
                picturepostCell.picture1.imageFromUrl(pidpost.postImages[0], defaultImgPath : "http:// ~~ ")
                picturepostCell.pictureStackview.isHidden = true
                picturepostCell.picture1.layer.cornerRadius = 10
                picturepostCell.picture1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }
            else if pidpost.postImages.count == 2 {
                picturepostCell.picture1.imageFromUrl(pidpost.postImages[0], defaultImgPath : "http:// ~~ ")
                picturepostCell.picture2.imageFromUrl(pidpost.postImages[1], defaultImgPath : "http:// ~~ ")
                picturepostCell.pictureStackview.isHidden = false
                picturepostCell.picture3.isHidden = true
                picturepostCell.pictureStackviewWidth.constant = 127.5
                picturepostCell.picture1.layer.cornerRadius = 10
                picturepostCell.picture1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                picturepostCell.picture2.layer.cornerRadius = 10
                picturepostCell.picture2.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            }
            else {
                picturepostCell.picture1.imageFromUrl(pidpost.postImages[0], defaultImgPath : "http:// ~~ ")
                picturepostCell.picture2.imageFromUrl(pidpost.postImages[1], defaultImgPath : "http:// ~~ ")
                picturepostCell.picture3.imageFromUrl(pidpost.postImages[2], defaultImgPath : "http:// ~~ ")
                picturepostCell.pictureStackview.isHidden  = false
                picturepostCell.picture3.isHidden = false
                picturepostCell.pictureStackviewWidth.constant = 107
                picturepostCell.picture1.layer.cornerRadius = 10
                picturepostCell.picture1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                picturepostCell.picture2.layer.cornerRadius = 10
                picturepostCell.picture2.layer.maskedCorners = [.layerMaxXMinYCorner]
                picturepostCell.picture3.layer.cornerRadius = 10
                picturepostCell.picture3.layer.maskedCorners = [.layerMaxXMaxYCorner]
            }
            
            picturepostCell.newsTitle?.text = pidpost.postTitle
            picturepostCell.newsPost?.text = pidpost.description
            picturepostCell.newsImg?.imageFromUrl(pidpost.image, defaultImgPath : "http:// ~~ ")
            picturepostCell.newsImg?.layer.cornerRadius = 10
            picturepostCell.picturefilpCount?.text = "Flips \((pidpost.bookmark)) Comments \((pidpost.commentsCount))"
            picturepostCell.picturefilpCount?.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
            picturepostCell.picturefilpCount?.textColor = .veryLightPink
            picturepostCell.picturepostBookmark?.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
            picturepostCell.newsshareView?.setBorder(borderColor: .veryLightPink, borderWidth: 1)
            picturepostCell.newsshareView?.setRounded(radius: 10)
            
            return picturepostCell
            
        }
        
        return UITableViewCell()
    }
    
    
}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 56
            }
            
        }
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                return 107
            }
        }
        else if indexPath.section == 2 {
            if indexPath.row == 0 {
                return 410
            }
            else if indexPath.row == 1 {
                return 410
            }
            else if indexPath.row == 2 {
                return 410
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == 0 {
                return 107
            }
        }
        else {
            return UITableView.automaticDimension
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableCell = cell as? MainCatarogyCell else { return }
        tableCell.setCollectionViewDelegate(self, for: indexPath.row)
    }
    
}
/*
 extension ViewController: UICollectionViewDelegateFlowLayout {
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
 return 14
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
 return 14
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
 return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 let height: CGFloat = 30
 let text = CategoryViewList[indexPath.item]
 let size = CGSize(width: 1000, height: height)
 let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
 let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
 let width: CGFloat = estimatedFrame.width
 return CGSize(width: width + 24, height: height)
 }
 }
 */
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCategory = indexPath.item
        self.FeedTV.reloadData()
    }
}

extension ViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
        //        self.tabBarController?.tabBar.layer.zPosition = 0
        //        self.tabBarController?.tabBar.barTintColor = .white
    }
}

extension ViewController {
    func setTop3() {
        FeedService.shared.getPostTop3 { responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                if let top3List = data as? [topArr] {
                    self.top3List = top3List
                    self.FeedTV.reloadData()
                }
            case .requestErr(_):
                print("request error")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail :
                print("failure")
            }
        }
    }
    
    func setPostPid(){
        FeedService.shared.getPostPid { responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                
                if let pidList = data as? [pidArr] {
                    self.PidList = pidList
                    self.FeedTV.reloadData()
                }
                
            case .requestErr(_):
                print("request error")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail :
                print("failure")
            }
        }
    }
    
    func setCategroyBar() {
        PostService.shared.groupCategory { responsedata in
            PostService.shared.groupCategory(){
                [weak self]
                data in
                
                guard let `self` = self else { return }
                
                switch data {
                    
                // 매개변수에 어떤 값을 가져올 것인지
                case .success(let res):
                    print("카테고리 조회 성공")
                    
                    let response = res as! GroupCategory
                    self.CategoryList = response.data as? categoryData
                    self.CategoryViewList = (self.CategoryList?.category as? [String])!
                    
                    
                case .requestErr(let message):
                    self.simpleAlert(title: "카테고리 조회 실패", message: "\(message)")
                    
                case .pathErr:
                    print(".pathErr")
                    
                case .serverErr:
                    print(".serverErr")
                    
                case .networkFail:
                    self.simpleAlert(title: "카테고리 조회 실패", message: "네트워크 상태를 확인해주세요.")
                }
            }
        }
    }
    
    func setCategory(_ category : String ) {
        FeedService.shared.getPostHash(category) { responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                if let hostList = data as? [PIDArr] {
                    self.hostList = hostList
                }
            case .requestErr(_):
                print("request error")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail :
                print("failure")
            }
        }
    }
    
    func getBookmark() {
        BookmarkService.shared.getBookmark { responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                if let bookmarkList = data as? [Category] {
                    self.bookmarkList = bookmarkList
                }
            case .requestErr(_):
                print("request error")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail :
                print("failure")
            }
        }
    }
}
