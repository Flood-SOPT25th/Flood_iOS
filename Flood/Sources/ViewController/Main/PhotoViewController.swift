//
//  PhotoViewController.swift
//  Flood
//
//  Created by hjyoo on 2020/01/02.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var postpictureCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetting()
        
        postpictureCV.delegate = self
        postpictureCV.dataSource = self
    }
    
    func initSetting(){
        
        // 네비게이션 바 배경색 설정 및 경계선 없애는 설정
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .blackTwo
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        let button1 = UIBarButtonItem(image: UIImage(named: "icX-1"), style: .plain, target: self, action: Selector("action"))
        self.navigationItem.rightBarButtonItem  = button1
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icLeftArrow-1")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icLeftArrow-1")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
    }
    
}

// MARK: - UICollectionViewDelegate
extension PhotoViewController: UICollectionViewDelegate {
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
extension PhotoViewController: UICollectionViewDataSource {
    //섹션 내에 속한 셀의 갯수(필수)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 //CategoryViewList.count
        
    }
    //각 항복에 대한 셀 객체 공급(필수)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let pictureCell = PictureCell.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCell
        
        
        return UICollectionViewCell()

}
    
}

