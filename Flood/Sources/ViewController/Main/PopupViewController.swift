//
//  PopupViewController.swift
//  Flood
//
//  Created by hjyoo on 2019/12/29.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class PopupViewController : UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupCV: UICollectionView!
    
    // MARK: - Variables and Properties
    
    var bookmarkList : [Category] = []
    var postId : String?
    var successAdd : Bool?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBookmark()
        popupCV.reloadData()
        
        popupCV.delegate = self
        popupCV.dataSource = self
        
        popupView.transform = .init(translationX: 0, y: popupView.bounds.height)
        
        setupGesture()
        setupCornerRound()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {
            self.popupView.transform = .identity
        })
    }
    
    // MARK: -Helpers
    
    func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handle(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func handle(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.popupView.transform = .init(translationX: 0, y: self.popupView.bounds.height)
        }) { _ in
            self.dismiss(animated: true)
        }
    }
    
    func setupCornerRound() {
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 10
        popupView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
}

// MARK: - UICollectionViewDelegate

extension PopupViewController : UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension PopupViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookmarkList.count-1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let popupCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupCell", for: indexPath) as! PopupCell
        
        popupCell.bookmarkName.text = bookmarkList[indexPath.row+1].categoryName
        popupCell.bookmarkImg.imageFromUrl(bookmarkList[indexPath.row+1].thumb , defaultImgPath: "http:// ~~ ")
        
        
        return popupCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        postFlip("5e009585beecc40d80a4c835", bookmarkList[indexPath.row+1].categoryID!)
        
//        if successAdd == true{
//            simpleAlert(title: "북마크 추가에 성공했습나다", message: "")
//        } else {
//            simpleAlert(title: "북마크 추가에 실패했습니다", message: "")
//        }
        
    }
    
    
}

// MARK: -UIGestureRecognizerDelegate

extension PopupViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: popupView))! {
            return false
        }
        return true
    }
}

// 준현
// Todo : bookmark_add 서버 통신

extension PopupViewController {
    
    func postFlip(_ postId: String, _ categoryId: String) {
        BookmarkService.shared.addBookmark(postId, categoryId)  { responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let _):
                print("success")
//                self.successAdd = true
            case .requestErr(_):
                print("request error")
//                self.successAdd = false
            case .pathErr:
                print(".pathErr")
//                self.successAdd = false
            case .serverErr:
                print(".serverErr")
//                self.successAdd = false
            case .networkFail :
                print("failure")
//                self.successAdd = false
            }
        }
        
    }
    
    func getBookmark() {
        BookmarkService.shared.getBookmark {
            responsedata in
            
            switch responsedata {
                
            // NetworkResult 의 요소들
            case .success(let data):
                guard let data = data as? [Category] else { return }
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

    
}
