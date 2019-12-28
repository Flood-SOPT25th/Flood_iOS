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
        
        navigationController?.isNavigationBarHidden = true
        
    }
    
    // MARK: -Helpers
    /*
     @IBAction func BookmarkAction(_ sender: UIButton) {
     let view = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
     view.modalPresentationStyle = .fullScreen
     self.present(view, animated: true, completion: nil)
     }*/
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
}
// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    //섹션 내에 속한 셀의 갯수(필수)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
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
                    
                    thisweekCell1.thisweekImg.image = UIImage(named: "41")
                    thisweekCell1.thisweekTitle.text = "기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀기사타이틀"
                    
                    thisweekCell1.thisweekflipCount.text = "플립수"
                    thisweekCell1.thisweekMore.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell1.thisweekBookmark.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell1.thisweekprofileImg.image = UIImage(named: "40")
                    thisweekCell1.thisweekName.text = "이름"
                    thisweekCell1.thisweekTime.text = "시간"
                    thisweekCell1.thisweekPost.text = "게시글"
                    
                    return thisweekCell1
                }
                else if indexPath.row == 1 {
                    let thisweekCell2 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell2", for: indexPath) as! ThisWeekCell2
                    
                    thisweekCell2.thisweekImg2.image = UIImage(named: "41")
                    thisweekCell2.thisweekTitle2.text = "기사타이틀2"
                    thisweekCell2.thisweekflipCount2.text = "플립수2"
                    thisweekCell2.thisweekMore2.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell2.thisweekBookmark2.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell2.thisweekprofileImg2.image = UIImage(named: "40")
                    thisweekCell2.thisweekName2.text = "이름2"
                    thisweekCell2.thisweekTime2.text = "시간2"
                    thisweekCell2.thisweekPost2.text = "게시글2"
                    
                    
                    return thisweekCell2
                }
                else {
                    let thisweekCell3 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell3", for: indexPath) as! ThisWeekCell3
                    
                    thisweekCell3.thisweekImg3.image = UIImage(named: "41")
                    thisweekCell3.thisweekTitle3.text = "기사타이틀3"
                    thisweekCell3.thisweekflipCount3.text = "플립수3"
                    thisweekCell3.thisweekMore3.setImage(UIImage(named: "icMoreWhite"), for: .normal)
                    thisweekCell3.thisweekBookmark3.setImage(UIImage(named: "icBookmarkWhite"), for: .normal)
                    thisweekCell3.thisweekprofileImg3.image = UIImage(named: "40")
                    thisweekCell3.thisweekName3.text = "이름3"
                    thisweekCell3.thisweekTime3.text = "시간3"
                    thisweekCell3.thisweekPost3.text = "게시글3"
                    
                    return thisweekCell3
                }
            }
            
        case self.postTV:
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    let newssharepostCell = postTV.dequeueReusableCell(withIdentifier: "NewsSharePostCell", for: indexPath) as! NewsSharePostCell
                    
                    newssharepostCell.newsshareCatarogy.text = "카테고리"
                    newssharepostCell.newsshareprofileImg.image = UIImage(named: "")
                    newssharepostCell.newsshareName.text = "이름"
                    newssharepostCell.newsshareTime.text = "시간"
                    newssharepostCell.newsPost.text = "게시글"
                    newssharepostCell.newsshareMore.image = UIImage(named: "icMoreWhite")
                    newssharepostCell.newsTitle.text = "제목"
                    newssharepostCell.newsPost.text = "게시글"
                    newssharepostCell.newsImg.image = UIImage(named: "")
                    newssharepostCell.newsflipCount.text = "플립수"
                    newssharepostCell.newsshareBookmark.image = UIImage(named: "icBookmarkWhite")
                    
                    return newssharepostCell
                }
                else if indexPath.row == 1 {
                    let picturepostCell = postTV.dequeueReusableCell(withIdentifier: "PicturePostCell", for: indexPath) as! PicturePostCell
                    
                    picturepostCell.picturepostCatagory.text = "카테고리"
                    picturepostCell.picturepostprofileImg.image = UIImage(named: "")
                    picturepostCell.picturepostName.text = "이름"
                    picturepostCell.picturepostTime.text = "시간"
                    picturepostCell.picturepostPost.text = "게시글"
                    picturepostCell.picturepostMore.image = UIImage(named: "icMoreWhite")
                    picturepostCell.picture1.image = UIImage(named: "")
                    picturepostCell.picture2.image = UIImage(named: "")
                    picturepostCell.picture3.image = UIImage(named: "")
                    picturepostCell.picturefilpCount.text = "플립수"
                    picturepostCell.picturepostBookmark.image = UIImage(named: "icBookmarkWhite")
                    
                    return picturepostCell
                }
                else {
                    let PostCell = postTV.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
                    
                    PostCell.postCatagory.text = "카테고리"
                    PostCell.postprofileImg.image = UIImage(named: "")
                    PostCell.postName.text = "이름"
                    PostCell.postTime.text = "시간"
                    PostCell.postPost.text = "게시글"
                    PostCell.postMore.image = UIImage(named: "icMoreWhite")
                    PostCell.postfilpCount.text = "플립수"
                    //PostCell.postBookmark.image = UIImage(named: "icBookmarkWhite")
                    
                    PostCell.delegate = self
                    return PostCell
                }
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}
