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
    var CategoryList : categoryData?
    var CategoryViewList : [String] = []
    var PostTop3dataset : PostTop3!
    var top3List : [topArr] = []
    var PostPiddataset : PostPid!
    var PidList : [pidArr] = []
    var test = ["flood", "IT", "스타트업"]
    
    
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
        
        // 서버 통신
        setTop3()
        setPostPid()
        setCategroyBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
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
        
        if let index = thisweekTV.indexPathForSelectedRow {
            thisweekTV.deselectRow(at: index, animated: true)
        }
    }
    
    
    
    // MARK: -Helpers
    
    @IBAction func webConncet(_ sender: UIButton) {
        guard let url = URL(string: "https://www.google.com"),
            UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
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
        return CategoryViewList.count
        //CategoryList.count
    }
    //각 항복에 대한 셀 객체 공급(필수)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let MainCatarogyCell = maincatarogyCV.dequeueReusableCell(withReuseIdentifier: "MainCatarogyCell", for: indexPath) as! MainCatarogyCell
        
        //let catagorypost = CategoryList[indexPath.row]
        MainCatarogyCell.maincatarogy?.setTitle(CategoryViewList[indexPath.row], for: .normal)
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
            return top3List.count
        case self.postTV:
            print("pidlist count"+String(PidList.count))
            return PidList.count
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
            let top3post = top3List[indexPath.row]
            let thisweekCell = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell", for: indexPath) as! ThisWeekCell
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
            thisweekCell.thisweekName.text = top3post.writer
            thisweekCell.thisweekName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
            thisweekCell.thisweekTime.text = top3post.postDate
            thisweekCell.thisweekTime.font = UIFont.systemFont(ofSize: CGFloat(12))
            thisweekCell.thisweekTime.textColor = .veryLightPink
            thisweekCell.thisweekPost.text = top3post.postContent
            thisweekCell.thisweekPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
            
            return thisweekCell
            
        case self.postTV:
            let pidpost = PidList[indexPath.row]
            let newssharepostCell = postTV.dequeueReusableCell(withIdentifier: "NewsSharePostCell", for: indexPath) as! NewsSharePostCell
            
            newssharepostCell.newsshareCatarogy.text = "카테고리"
            newssharepostCell.newsshareCatarogy.font = UIFont(name: "NotoSansCJKkr-Regular", size:12)
            newssharepostCell.newsshareCatarogy.setBorder(borderColor: .electricBlue, borderWidth: 1)
            newssharepostCell.newsshareCatarogy.setRounded(radius: 10)
            newssharepostCell.newsshareCatarogy.textColor = .electricBlue
            //newssharepostCell.newsshareprofileImg.image = UIImage(named: "14")
            newssharepostCell.newsshareprofileImg.imageFromUrl(pidpost.postImages[indexPath.row], defaultImgPath : "http:// ~~ ")
            newssharepostCell.newsshareprofileImg.setRounded(radius: 10)
            //newssharepostCell.newsshareName.text = "이름"
            newssharepostCell.newsshareName.text = pidpost.writer
            newssharepostCell.newsshareName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
            //newssharepostCell.newsshareTime.text = "시간"
            newssharepostCell.newsshareTime.text = pidpost.postDate
            newssharepostCell.newsshareTime.font = UIFont.systemFont(ofSize: CGFloat(12))
            newssharepostCell.newsshareTime.textColor = .veryLightPink
            //newssharepostCell.newssharePost.text = "게시글"
            newssharepostCell.newssharePost.text = pidpost.postContent
            newssharepostCell.newsPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
            newssharepostCell.newsshareMore.setImage(UIImage(named: "icMoreGray"), for: .normal)
            newssharepostCell.newsTitle.text = pidpost.title //"제목"
            newssharepostCell.newsPost.text = pidpost.description  //"뉴스글"
            newssharepostCell.newsImg.image = UIImage(named: "26")
            newssharepostCell.newsflipCount.text = "플립수"
            newssharepostCell.newsflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
            newssharepostCell.newsflipCount.textColor = .veryLightPink
            newssharepostCell.newsshareBookmark.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
            newssharepostCell.newsshareView.setBorder(borderColor: .veryLightPink, borderWidth: 1)
            newssharepostCell.newsshareView.setRounded(radius: 10)
            
            return newssharepostCell

        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let NSPostDetailView = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewsSharePostDetailView") as? NewsSharePostDetailView
                self.navigationController?.pushViewController(NSPostDetailView!, animated: true)
            }
        }
    }
    
}

//// MARK: - Kingfisher: UIImageView
//
//extension UIImageView {
//    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
//        let defaultImg = UIImage(named: defaultImgPath)
//        if let url = urlString {
//            if url.isEmpty {
//                self.image = defaultImg
//            } else {
//                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
//            }
//        } else {
//            self.image = defaultImg
//        }
//    }
//}

//DispatchQueue.main.async { }

extension MainViewController {
    func setTop3() {
        PostTop3Services.shared.getPostTop3 { responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                if let top3List = data as? [topArr] {
                    self.top3List = top3List
                    self.thisweekTV.reloadData()
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
        PostPidServices.shared.getPostPid { responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                if let pidList = data as? [pidArr] {
                    self.PidList = pidList
                    self.postTV.reloadData()
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
                    self.maincatarogyCV.reloadData()
                    
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
}
