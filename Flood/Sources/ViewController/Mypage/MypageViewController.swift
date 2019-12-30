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
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var myPostView: UIView!
    @IBOutlet weak var postCountView: UIView!
    @IBOutlet weak var flipCollectionView: UICollectionView!
    
    // MARK: - Variables and Properties

    
    // MARK: - Dummy Data
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.flipCollectionView.delegate = self
        self.flipCollectionView.dataSource = self
        self.flipCollectionView.reloadData()
        
        setRadius()
        setBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: -Helpers
    
    // 마이페이지에서 둥글게 하는 function
    func setRadius() {
        profileView.setRounded(radius: 28)
        profileView.backgroundColor = .black
        postCountView.setRounded(radius: 10)
    }
    
    func setBorder() {
        myPostView.layer.addBorder([.top, .bottom], color: UIColor.gray, width: 1.0)
    }
    
    func checkCollectionView() {
        
        
    }
    
}

extension MypageViewController : UITableViewDelegate {
    
}

extension MypageViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}

// MARK: - CollectionViewDelegate

extension MypageViewController : UICollectionViewDelegate {
    
}

// MARK: - CollectionViewDataSource
extension MypageViewController : UICollectionViewDataSource {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MypageFlipCollectionViewCell", for: indexPath) // TestCollectionCell은 스토리보드에서 등록한 Cell Identifier

        cell.backgroundColor = .gray
        
        
        return cell
    }
        
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        if (kind == UICollectionView.elementKindSectionFooter) {
//            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MypageCollectionReusableView", for: indexPath)
//            // Customize footerView here
//            return footerView
//        } else if (kind == UICollectionView.elementKindSectionHeader) {
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MypageCollectionReusableView", for: indexPath)
//            // Customize headerView here
//            return headerView
//        }
//        fatalError()
//    }

    
}
