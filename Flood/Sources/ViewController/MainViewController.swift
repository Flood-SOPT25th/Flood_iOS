//
//  MainViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/23.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI components
    @IBOutlet var maincatarogyCV: UICollectionView!
    @IBOutlet weak var thisweekTV: UITableView!
    @IBOutlet weak var postTV: UITableView!
    
    // MARK: - Variables and Properties
    
    
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
    
}
// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    //섹션 내에 속한 셀의 갯수(필수)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        //appDelegate.workList.count
    }
    //각 항복에 대한 셀 객체 공급(필수)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let MainCatarogyCell = maincatarogyCV.dequeueReusableCell(withReuseIdentifier: "MainCatarogyCell", for: indexPath) as! MainCatarogyCell
        
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
                if indexPath.row == 0 {
                    let thisweekCell1 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell1", for: indexPath) as! ThisWeekCell
                    
                    thisweekCell1.thisweekImg.image = UIImage(named: "15")
                    thisweekCell1.thisweekTitle.text = "기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀"
                    thisweekCell1.thisweekTitle.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                    thisweekCell1.thisweekTitle.textColor = .white
                    thisweekCell1.thisweekflipCount.text = "플립수"
                    thisweekCell1.thisweekflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    thisweekCell1.thisweekflipCount.textColor = .white
                    thisweekCell1.thisweekMore.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell1.thisweekBookmark.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell1.thisweekprofileImg.image = UIImage(named: "40")
                    thisweekCell1.thisweekName.text = "이름"
                    thisweekCell1.thisweekName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    thisweekCell1.thisweekTime.text = "시간"
                    thisweekCell1.thisweekTime.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
                    thisweekCell1.thisweekTime.textColor = .veryLightPink
                    thisweekCell1.thisweekPost.text = "게시글"
                    thisweekCell1.thisweekPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    
                    return thisweekCell1
                }
                else if indexPath.row == 1 {
                    let thisweekCell2 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell2", for: indexPath) as! ThisWeekCell2
                    
                    thisweekCell2.thisweekImg2.image = UIImage(named: "15")
                    thisweekCell2.thisweekTitle2.text = "기사타이틀2"
                    thisweekCell2.thisweekTitle2.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                    thisweekCell2.thisweekTitle2.textColor = .white
                    thisweekCell2.thisweekflipCount2.text = "플립수2"
                    thisweekCell2.thisweekflipCount2.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    thisweekCell2.thisweekflipCount2.textColor = .white
                    thisweekCell2.thisweekMore2.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell2.thisweekBookmark2.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell2.thisweekprofileImg2.image = UIImage(named: "40")
                    thisweekCell2.thisweekName2.text = "이름"
                    thisweekCell2.thisweekName2.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    thisweekCell2.thisweekTime2.text = "시간"
                    thisweekCell2.thisweekTime2.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
                    thisweekCell2.thisweekTime2.textColor = .veryLightPink
                    thisweekCell2.thisweekPost2.text = "게시글"
                    thisweekCell2.thisweekPost2.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    
                    
                    return thisweekCell2
                }
                else {
                    let thisweekCell3 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell3", for: indexPath) as! ThisWeekCell3
                    
                    thisweekCell3.thisweekImg3.image = UIImage(named: "15")
                    thisweekCell3.thisweekTitle3.text = "기사타이틀3"
                    thisweekCell3.thisweekTitle3.font = UIFont(name: "NotoSansCJKkr-Bold", size: 24)
                    thisweekCell3.thisweekTitle3.textColor = .white
                    thisweekCell3.thisweekflipCount3.text = "플립수3"
                    thisweekCell3.thisweekflipCount3.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    thisweekCell3.thisweekflipCount3.textColor = .white
                    thisweekCell3.thisweekMore3.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell3.thisweekBookmark3.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell3.thisweekprofileImg3.image = UIImage(named: "40")
                    thisweekCell3.thisweekName3.text = "이름"
                    thisweekCell3.thisweekName3.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    thisweekCell3.thisweekTime3.text = "시간"
                    thisweekCell3.thisweekTime3.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
                    thisweekCell3.thisweekTime3.textColor = .veryLightPink
                    thisweekCell3.thisweekPost3.text = "게시글"
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
                    newssharepostCell.newsshareprofileImg.image = UIImage(named: "")
                    newssharepostCell.newsshareName.text = "이름"
                    newssharepostCell.newsshareName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    newssharepostCell.newsshareTime.text = "시간"
                    newssharepostCell.newsshareTime.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
                    newssharepostCell.newsshareTime.textColor = .veryLightPink
                    newssharepostCell.newsPost.text = "게시글"
                    newssharepostCell.newsPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    newssharepostCell.newsshareMore.setImage(UIImage(named: "icMoreGray"), for: .normal)
                    newssharepostCell.newsTitle.text = "제목"
                    newssharepostCell.newsPost.text = "게시글"
                    newssharepostCell.newsImg.image = UIImage(named: "")
                    newssharepostCell.newsflipCount.text = "플립수"
                    newssharepostCell.newsflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                    newssharepostCell.newsflipCount.textColor = .veryLightPink
                    newssharepostCell.newsshareBookmark.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
                    
                    return newssharepostCell
                }
                else if indexPath.row == 1 {
                    let picturepostCell = postTV.dequeueReusableCell(withIdentifier: "PicturePostCell", for: indexPath) as! PicturePostCell
                    
                    picturepostCell.picturepostCatagory.text = "카테고리"
                    picturepostCell.picturepostCatagory.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
                    picturepostCell.picturepostCatagory.textColor = .electricBlue
                    picturepostCell.picturepostprofileImg.image = UIImage(named: "")
                    picturepostCell.picturepostName.text = "이름"
                    picturepostCell.picturepostName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    picturepostCell.picturepostTime.text = "시간"
                    picturepostCell.picturepostTime.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
                    picturepostCell.picturepostTime.textColor = .veryLightPink
                    picturepostCell.picturepostPost.text = "게시글"
                    picturepostCell.picturepostPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                    picturepostCell.picturepostMore.setImage(UIImage(named: "icMoreGray"), for: .normal)
                    picturepostCell.picture1.image = UIImage(named: "")
                    picturepostCell.picture2.image = UIImage(named: "")
                    picturepostCell.picture3.image = UIImage(named: "")
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
                    PostCell.postprofileImg.image = UIImage(named: "")
                    PostCell.postName.text = "이름"
                    PostCell.postName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                    PostCell.postTime.text = "시간"
                    PostCell.postTime.font = UIFont(name: "NotoSansCJKkr-Medium", size: 12)
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
