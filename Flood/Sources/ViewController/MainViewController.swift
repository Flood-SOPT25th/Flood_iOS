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
        postTV.separatorInset.left = 0
        
    }
    
    // MARK: -Helpers
    
    
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
                let thisweekCell1 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell1", for: indexPath) as! ThisWeekCell
                
                
                thisweekCell1.thisweekName.text = "flood"
                
                return thisweekCell1
            }
            else if indexPath.section == 1 {
                let thisweekCell2 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell2", for: indexPath) as! ThisWeekCell
                
                
                thisweekCell2.thisweekName.text = "flood"
                
                return thisweekCell2
            }
            else {
                let thisweekCell3 = thisweekTV.dequeueReusableCell(withIdentifier: "ThisWeekCell3", for: indexPath) as! ThisWeekCell
                
                thisweekCell3.thisweekName.text = "flood"
                
                return thisweekCell3
            }
            
        case self.postTV:
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    let newssharepostCell = postTV.dequeueReusableCell(withIdentifier: "NewsSharePostCell", for: indexPath) as! NewsSharePostCell
                    
                    return newssharepostCell
                }
                else if indexPath.row == 1 {
                    let picturepostCell = postTV.dequeueReusableCell(withIdentifier: "PicturePostCell", for: indexPath) as! PicturePostCell
                    return picturepostCell
                }
                else {
                    let PostCell = postTV.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
                    
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
