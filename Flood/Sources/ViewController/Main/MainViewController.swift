//
//  MainViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/23.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    // MARK: - UI components
    @IBOutlet var maincatarogyCV: UICollectionView!
    @IBOutlet weak var thisweekTV: UITableView!
    @IBOutlet weak var postTV: UITableView!

    
    // MARK: - Variables and Properties
    
    var Categorydataset : GroupCategory!
    var CategoryList : [DataClass] = []
    var PostTop3dataset : PostTop3!
    var top3List : [topArr] = []
    var PostPiddataset : PostPid!
    var PidList : [pidArr] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maincatarogyCV.delegate = self
        maincatarogyCV.dataSource = self
        thisweekTV.delegate = self
        thisweekTV.dataSource = self
        thisweekTV.separatorInset.left = 0
        postTV.delegate = self
        postTV.dataSource = self
        //tableviewcell 왼쪽라인 채우기
        postTV.separatorInset.left = 0
        
        // 네비게이션 바 배경색 설정 및 경계선 없애는 설정
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        // 탭바 배경색 설정
        self.tabBarController?.tabBar.backgroundColor = .white
        self.tabBarController?.tabBar.isTranslucent = false
        
        PostTop3Services.shared.getPostTop3 {
            responsedata in
            
            switch responsedata {
            
            // NetworkResult 의 요소들
            case .success(let data):
                
                print("data",data)
                self.PostTop3dataset = data as? PostTop3
                self.top3List = self.PostTop3dataset.data!

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
        
        PostPidServices.shared.getPostPid {
            responsedata in
            
            switch responsedata {
            
            // NetworkResult 의 요소들
            case .success(let data):
                
                print("data",data)
                self.PostPiddataset = data as? PostPid
                self.PidList = self.PostPiddataset.data!

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    


    
    // MARK: -Helpers
 
    
    @IBAction func popupAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "PopupViewController") as! PopupViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        
        if let tbc = self.tabBarController {
            tbc.present(vc, animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
/*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let categoryCell = maincatarogyCV.cellForItem(at: indexPath) as? MainCatarogyCell else {return}
        self.CategoryList[indexPath.item].isClick = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let categoryCell = maincatarogyCV.cellForItem(at: indexPath) as? MainCatarogyCell else {return}
        self.CategoryList![indexPath.item].isClick = false
    }
*/
}
// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    //섹션 내에 속한 셀의 갯수(필수)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        //CategoryList.count
    }
    //각 항복에 대한 셀 객체 공급(필수)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let MainCatarogyCell = maincatarogyCV.dequeueReusableCell(withReuseIdentifier: "MainCatarogyCell", for: indexPath) as! MainCatarogyCell
        
        //let catagorypost = CategoryList[indexPath.row]
        MainCatarogyCell.maincatarogy?.setTitle("Flood", for: .normal)
        // = catagorypost["category"] as! String
        MainCatarogyCell.maincatarogy?.makeRounded(cornerRadius: 18)
        MainCatarogyCell.maincatarogy?.layer.shadowColor = UIColor.black.cgColor
        MainCatarogyCell.maincatarogy?.layer.shadowRadius = 5
        
        
        return MainCatarogyCell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
}
// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case self.thisweekTV:
            return 3
        case self.postTV:
            return 3
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch tableView {
        case self.thisweekTV:
            if indexPath.section == 0 {
                return 410
            }
            
        case postTV:
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    return 501
                }
                else if indexPath.row == 1 {
                    return 416
                }
                else {
                    return 200
                }
            }
        default:
            return 0
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch tableView {
        case self.thisweekTV:
            if indexPath.section == 0 {
                  //let top3post = top3List[indexPath.row]

                if indexPath.row == 0 {
                    let thisweekCell1 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell1", for: indexPath) as! ThisWeekCell

                    thisweekCell1.thisweekImg.image = UIImage(named: "15")
                    //thisweekCell1.thisweekImg.imageFromUrl(top3post.postImages, defaultImgPath : "http:// ~~ ")
                    thisweekCell1.thisweekTitle.text = "기사타이틀1"
                    //thisweekCell1.thisweekTitle.text = top3post.title
                    thisweekCell1.thisweekTitle.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                    thisweekCell1.thisweekTitle.textColor = .white
                    thisweekCell1.thisweekflipCount.text = "Flips Comments"
                    //thisweekCell1.thisweekflipCount.text = "Flips \((top3post.bookmark)) Comments \((top3post.comments_count))"
                    thisweekCell1.thisweekflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    thisweekCell1.thisweekflipCount.textColor = .white
                    thisweekCell1.thisweekMore.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell1.thisweekBookmark.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell1.thisweekprofileImg.image = UIImage(named: "40")
                    //thisweekCell1.thisweekprofileImg.imageFromUrl(top3post.profileImage, defaultImgPath : "http:// ~~ ")
                    thisweekCell1.thisweekName.text = "이름"
                    //thisweekCell1.thisweekName.text = top3post.writer
                    thisweekCell1.thisweekName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    thisweekCell1.thisweekTime.text = "시간"
                    //thisweekCell1.thisweekTime.text = top3post.postDate
                    thisweekCell1.thisweekTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                    thisweekCell1.thisweekTime.textColor = .veryLightPink
                    thisweekCell1.thisweekPost.text = "게시글"
                    //thisweekCell1.thisweekPost.text = top3post.postContent
                    thisweekCell1.thisweekPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    
                    return thisweekCell1
                }
                else if indexPath.row == 1 {
                    let thisweekCell2 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell2", for: indexPath) as! ThisWeekCell2
                    
                    thisweekCell2.thisweekImg2.image = UIImage(named: "15")
                    //thisweekCell2.thisweekImg2.imageFromUrl(top3post.postImages, defaultImgPath : "http:// ~~ ")
                    thisweekCell2.thisweekTitle2.text = "기사타이틀2"
                    //thisweekCell2.thisweekTitle2.text = top3post.title
                    thisweekCell2.thisweekTitle2.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                    thisweekCell2.thisweekTitle2.textColor = .white
                    thisweekCell2.thisweekflipCount2.text = "플립수2"
                    //thisweekCell2.thisweekflipCount2.text = "Flips \((top3post.bookmark)) Comments \((top3post.comments_count))"
                    thisweekCell2.thisweekflipCount2.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    thisweekCell2.thisweekflipCount2.textColor = .white
                    thisweekCell2.thisweekMore2.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell2.thisweekBookmark2.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell2.thisweekprofileImg2.image = UIImage(named: "40")
                    //thisweekCell2.thisweekprofileImg2.imageFromUrl(top3post.profileImage, defaultImgPath : "http:// ~~ ")
                    thisweekCell2.thisweekName2.text = "이름"
                    //thisweekCell2.thisweekName2.text = top3post.writer
                    thisweekCell2.thisweekName2.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    thisweekCell2.thisweekTime2.text = "시간"
                    //thisweekCell2.thisweekTime2.text = top3post.postDate
                    thisweekCell2.thisweekTime2.font = UIFont.systemFont(ofSize: CGFloat(12))
                    thisweekCell2.thisweekTime2.textColor = .veryLightPink
                    thisweekCell2.thisweekPost2.text = "게시글"
                    //thisweekCell2.thisweekPost2.text = top3post.postContent
                    thisweekCell2.thisweekPost2.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    
                    return thisweekCell2
                }
                else {
                    let thisweekCell3 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell3", for: indexPath) as! ThisWeekCell3
                    
                    thisweekCell3.thisweekImg3.image = UIImage(named: "15")
                    //thisweekCell3.thisweekImg3.imageFromUrl(top3post.postImages, defaultImgPath : "http:// ~~ ")
                    thisweekCell3.thisweekTitle3.text = "기사타이틀3"
                    //thisweekCell3.thisweekTitle3.text = top3post.title
                    thisweekCell3.thisweekTitle3.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                    thisweekCell3.thisweekTitle3.textColor = .white
                    thisweekCell3.thisweekflipCount3.text = "플립수3"
                    //thisweekCell3.thisweekflipCount3.text = "Flips \((top3post.bookmark)) Comments \((top3post.comments_count))"
                    thisweekCell3.thisweekflipCount3.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    thisweekCell3.thisweekflipCount3.textColor = .white
                    thisweekCell3.thisweekMore3.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell3.thisweekBookmark3.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell3.thisweekprofileImg3.image = UIImage(named: "40")
                    //thisweekCell3.thisweekprofileImg3.imageFromUrl(top3post.profileImage, defaultImgPath : "http:// ~~ ")
                    thisweekCell3.thisweekName3.text = "이름"
                    //thisweekCell3.thisweekName3.text = top3post.writer
                    thisweekCell3.thisweekName3.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    thisweekCell3.thisweekTime3.text = "시간"
                    //thisweekCell3.thisweekTime3.text = top3post.postDate
                    thisweekCell3.thisweekTime3.font = UIFont.systemFont(ofSize: CGFloat(12))
                    thisweekCell3.thisweekTime3.textColor = .veryLightPink
                    thisweekCell3.thisweekPost3.text = "게시글"
                    //thisweekCell3.thisweekPost3.text = top3post.postContent
                    thisweekCell3.thisweekPost3.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    
                    return thisweekCell3
                }
            }
            
        case self.postTV:
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    let newssharepostCell = postTV.dequeueReusableCell(withIdentifier: "NewsSharePostCell", for: indexPath) as! NewsSharePostCell
                    
                    newssharepostCell.newsshareCatarogy.text = "카테고리"
                    newssharepostCell.newsshareCatarogy.font = UIFont(name: "NotoSansCJKkr-Regular", size:12)
                    newssharepostCell.newsshareCatarogy.setBorder(borderColor: .electricBlue, borderWidth: 1)
                    newssharepostCell.newsshareCatarogy.setRounded(radius: 10)
                    newssharepostCell.newsshareCatarogy.textColor = .electricBlue
                    newssharepostCell.newsshareprofileImg.image = UIImage(named: "14")
                    newssharepostCell.newsshareprofileImg.setRounded(radius: 10)
                    newssharepostCell.newsshareName.text = "이름"
                    newssharepostCell.newsshareName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    newssharepostCell.newsshareTime.text = "시간"
                    newssharepostCell.newsshareTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                    newssharepostCell.newsshareTime.textColor = .veryLightPink
                    newssharepostCell.newssharePost.text = "게시글"
                    newssharepostCell.newsPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    newssharepostCell.newsshareMore.setImage(UIImage(named: "icMoreGray"), for: .normal)
                    newssharepostCell.newsTitle.text = "제목"
                    newssharepostCell.newsPost.text = "뉴스글"
                    newssharepostCell.newsImg.image = UIImage(named: "26")
                    newssharepostCell.newsflipCount.text = "플립수"
                    newssharepostCell.newsflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    newssharepostCell.newsflipCount.textColor = .veryLightPink
                    newssharepostCell.newsshareBookmark.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
                    newssharepostCell.newsshareView.setBorder(borderColor: .veryLightPink, borderWidth: 1)
                    newssharepostCell.newsshareView.setRounded(radius: 10)
                    
                    return newssharepostCell
                }
                else if indexPath.row == 1 {
                    let picturepostCell = postTV.dequeueReusableCell(withIdentifier: "PicturePostCell", for: indexPath) as! PicturePostCell
                    
                    picturepostCell.picturepostCatagory.text = "카테고리"
                    picturepostCell.picturepostCatagory.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
                    picturepostCell.picturepostCatagory.textColor = .electricBlue
                    picturepostCell.picturepostprofileImg.image = UIImage(named: "25")
                    picturepostCell.picturepostName.text = "이름"
                    picturepostCell.picturepostName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    picturepostCell.picturepostTime.text = "시간"
                    picturepostCell.picturepostTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                    picturepostCell.picturepostTime.textColor = .veryLightPink
                    picturepostCell.picturepostPost.text = "게시글"
                    picturepostCell.picturepostPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    picturepostCell.picturepostMore.setImage(UIImage(named: "icMoreGray"), for: .normal)
                    picturepostCell.picture1.image = UIImage(named: "39")
                    picturepostCell.picture2.image = UIImage(named: "40")
                    picturepostCell.picture3.image = UIImage(named: "41")
                    picturepostCell.picture1.layer.cornerRadius = 10
                    picturepostCell.picture1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                    picturepostCell.picture2.layer.cornerRadius = 10
                    picturepostCell.picture2.layer.maskedCorners = [.layerMaxXMinYCorner]
                    picturepostCell.picture3.layer.cornerRadius = 10
                    picturepostCell.picture3.layer.maskedCorners = [.layerMaxXMaxYCorner]
                    picturepostCell.picturefilpCount.text = "플립수"
                    picturepostCell.picturefilpCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    picturepostCell.picturefilpCount.textColor = .veryLightPink
                    picturepostCell.picturepostBookmark.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
                    
                    

                    
                    return picturepostCell
                }
                else {
                    let PostCell = postTV.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
                    
                    PostCell.postCatagory.text = "카테고리"
                    PostCell.postCatagory.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
                    PostCell.postCatagory.textColor = .electricBlue
                    PostCell.postprofileImg.image = UIImage(named: "44")
                    PostCell.postName.text = "이름"
                    PostCell.postName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    PostCell.postTime.text = "시간"
                    PostCell.postTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                    PostCell.postTime.textColor = .veryLightPink
                    PostCell.postPost.text = "게시글"
                    PostCell.postPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    PostCell.postMore.setImage(UIImage(named: "icMoreGray"), for: .normal)
                    PostCell.postfilpCount.text = "플립수"
                    PostCell.postfilpCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    PostCell.postfilpCount.textColor = .veryLightPink
                    PostCell.postBookmark.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
                    
                    return PostCell
                }
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
}

// MARK: - Kingfisher: UIImageView

extension UIImageView {
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
}

//DispatchQueue.main.async { }

