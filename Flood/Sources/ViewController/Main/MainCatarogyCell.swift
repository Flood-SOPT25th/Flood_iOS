//
//  MainCatarogyCell.swift
//  Flood
//
//  Created by hjyoo on 2019/12/26.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class MainCatarogyCell: UITableViewCell {
    
    @IBOutlet weak var CatagorysCV: UICollectionView!
    
    var Categorydata : [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()

        CatagorysCV.dataSource = self

    }

}

// MainCatarogyCell
// MARK: - UICollectionViewDataSource
extension MainCatarogyCell: UICollectionViewDataSource {
    //섹션 내에 속한 셀의 갯수(필수)
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categorydata.count
    }
    
    //각 항복에 대한 셀 객체 공급(필수)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("categoryList", Categorydata.count)
        let catarogyCell = CatagorysCV.dequeueReusableCell(withReuseIdentifier: "CatagorysCell", for: indexPath) as! CatagorysCell
        
        //let catagorypost = CategoryList[indexPath.row]
        catarogyCell.mainCategory?.setTitle(Categorydata[indexPath.row], for: .normal)
        
        if indexPath.item == 0 {
            catarogyCell.mainCategory?.setTitleColor(.white, for: .normal)
            catarogyCell.mainCategory?.backgroundColor = .electricBlue
            catarogyCell.mainCategory?.makeRounded(cornerRadius: 18)
            catarogyCell.mainCategory?.dropShadow(color: .blackTwo, offSet: CGSize(width: 2, height: 2), opacity: 0.1, radius: 2)
            return catarogyCell
        }
        else {
            catarogyCell.mainCategory?.setTitleColor(.veryLightPinkThree, for: .normal)
            catarogyCell.mainCategory?.backgroundColor = .white
            catarogyCell.mainCategory?.makeRounded(cornerRadius: 18)
            catarogyCell.mainCategory?.dropShadow(color: .blackTwo, offSet: CGSize(width: 2, height: 2), opacity: 0.08, radius: 2)
            
            return catarogyCell
        }
    }
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
     let categoryCell = CatagorysCV.dequeueReusableCell(withReuseIdentifier: "CatagorysCell", for: indexPath) as! CatagorysCell
     //현지가 일단 해놓은부분
     
     setCategory((categoryCell.maincatarogy?.titleLabel!.text)!)
     
     thisweekTV.isHidden = true
     PidList = hostList as! [pidArr]
     */
    
    //        var chooseCategory = categoryCell.maincatarogy?.titleLabel?.text
    //
    //        func findCategory(findString :String) -> Bool {
    //            return findString == chooseCategory
    //        }
}

extension MainCatarogyCell {
  func setCollectionViewDelegate<D: UICollectionViewDelegate>(_ delegate: D, for row: Int) {
    
    CatagorysCV.delegate = delegate
    CatagorysCV.reloadData()
    
  }
}


