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

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupCV.delegate = self
        popupCV.dataSource = self
        
        popupView.transform = .init(translationX: 0, y: popupView.bounds.height)
    
//        getBookmark()
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

extension PopupViewController : UICollectionViewDelegate {
    
}

extension PopupViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookmarkList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let popupCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupCell", for: indexPath) as! PopupCell
        
        popupCell.bookmarkName.text = bookmarkList[indexPath.row].categoryName
        popupCell.bookmarkImg.imageFromUrl(bookmarkList[indexPath.row].thumb , defaultImgPath: "http:// ~~ ")
        
        return popupCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    
}

extension PopupViewController: UIGestureRecognizerDelegate {
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    if (touch.view?.isDescendant(of: popupView))! {
      return false
    }
    return true
  }
}

//extension PopupViewController {
//    func getBookmark() {
//        BookmarkService.shared.getBookmark { responsedata in
//
//            switch responsedata {
//
//            // NetworkResult 의 요소들
//            case .success(let data):
//                if let bookmarkList = data as? [Category] {
//                    self.bookmarkList = bookmarkList
//                    self.popupCV.reloadData()
//                }
//            case .requestErr(_):
//                print("request error")
//            case .pathErr:
//                print(".pathErr")
//            case .serverErr:
//                print(".serverErr")
//            case .networkFail :
//                print("failure")
//            }
//        }
//    }
//}
//
