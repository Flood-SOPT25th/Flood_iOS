//
//  MypageViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/23.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {
    
    // MARK: - UI components
    @IBOutlet weak var mypageCollectionView: UICollectionView!
    
    // MARK: - Variables and Properties
    private let spacing : CGFloat = 16.0
    var bookmarkList : [Category] = []
    var myPid : [PIDArray] = []
    var infoData : [InfoData] = []
    var userInfo : [UserInfo] = []

    // MARK: - Dummy Data
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSetting()
        
        getBookmark()
        getMyPost()
        getMyInfo()
//        userInfo =
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.tabBarController?.tabBar.backgroundColor = .white
        self.tabBarController?.tabBar.isTranslucent = false
        
        mypageCollectionView.delegate = self
        mypageCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true

        getMyPost()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: -Helpers
    
    func initSetting() {

    }
        
    // 프로필 수정하는 페이지로 모달하는 function
    @objc func editProfile() {
        let vc = storyboard?.instantiateViewController(identifier:  "EditProfileViewController") as! EditProfileViewController
        vc.modalPresentationStyle = .fullScreen
        navigationController?.isNavigationBarHidden = false

        self.present(vc, animated: true)
    }
    
    // 내가 작성한 글의 페이지로 모달하는 function
    @objc func toMyPost() {
        let vc = storyboard?.instantiateViewController(identifier:  "MyPostViewController") as! MyPostViewController
        vc.modalPresentationStyle = .fullScreen
        navigationController?.isNavigationBarHidden = false

        self.present(vc, animated: true)
    }
    
    // 내 플립을 수정하는 페이지로 모달하는 function
    @objc func editMyFlip() {
        let vc = storyboard?.instantiateViewController(identifier:  "EditFlipViewController") as! EditFlipViewController
        vc.modalPresentationStyle = .fullScreen
        navigationController?.isNavigationBarHidden = false

        self.present(vc, animated: true)
        
    }
    
}

// MARK: - CollectionViewDelegate

extension MypageViewController : UICollectionViewDelegate { }

// MARK: - CollectionViewDataSource

extension MypageViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookmarkList.count
//        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MypageFlipCollectionViewCell", for: indexPath) as! MypageFlipCollectionViewCell
        
        cell.flipSubLabel.textColor = .veryLightPinkTwo
        cell.backgroundColor = .veryLightPink
        
//        cell.flipImageView.imageFromUrl(bookmarkList[indexPath.row].thumb, defaultImgPath: "")
//        cell.flipLabel.text = bookmarkList[indexPath.row].categoryName
//        cell.flipSubLabel.text = String(bookmarkList[indexPath.row].count) + " flips"
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 23

        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row

        if let collection = self.mypageCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 0, height: 0)
        }


    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FlipCollectionReusableView", for: indexPath) as? FlipCollectionReusableView else {
                    fatalError("Invalid view type")
            }
            
            headerView.postCnt.textColor = .white
            headerView.postCnt.setRounded(radius: 10)
            headerView.postCnt.backgroundColor = .black
            headerView.profileIMG.setRounded(radius: 28)
            headerView.postView.layer.addBorder([.top, .bottom], color: .veryLightPinkTwo, width: 1)
            headerView.postCnt.text! = String(myPid.count)
            
            headerView.profileIMG.imageFromUrl("", defaultImgPath: "")
//            headerView.profileName.text = infoData

            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
    
    
    
}

extension MypageViewController {
    
    func getBookmark() {
        BookmarkService.shared.getBookmark {
            responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                guard let data = data as? [Category] else { return }
                print("getBookmark() : ", data)
                self.bookmarkList = data
                
            case .requestErr(_):
                print("getBookmark request error")
            case .pathErr:
                print("getBookmark .pathErr")
            case .serverErr:
                print("getBookmark .serverErr")
            case .networkFail :
                print("getBookmark failure")
            }
        }
    }
    
    func getMyPost() {
        MyPageSerivce.shared.MyPageMyPost() {
            responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                guard let data = data as? [PIDArray] else { return }
                print("ㅐㅐㅐㅐㅐㅐ : ",data)
                print("mypid : ", data.count)
                self.myPid = data
                print("mypid : ", self.myPid.count)

            case .requestErr(_):
                print("getMyPost request error")
            case .pathErr:
                print("getMyPost .pathErr")
            case .serverErr:
                print("getMyPost .serverErr")
            case .networkFail :
                print("getMyPost failure")
            }
        }
    }

    func getMyInfo() {
        MyPageSerivce.shared.MypageInfo() {
            responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                guard let data = data as? [InfoData] else { return }
                print("infoData in viewcon : ", data)
                print("infoData in viewcon : ", data.count)
                self.infoData = data
                print("infoData : ", self.infoData.count)

            case .requestErr(_):
                print("getMyInfo request error")
            case .pathErr:
                print("getMyInfo .pathErr")
            case .serverErr:
                print("getMyInfo .serverErr")
            case .networkFail :
                print("getMyInfo failure")
            }
        }
    }


}
