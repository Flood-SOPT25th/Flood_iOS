//
//  NewsSharePostDetailView.swift
//  Flood
//
//  Created by hjyoo on 2019/12/27.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class NewsSharePostDetailView : UIViewController {
    
    // MARK: - UI components

    @IBOutlet weak var newssharepostTV: UITableView!
    
    // MARK: - Variables and Properties

    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newssharepostTV.delegate = self
        newssharepostTV.dataSource = self
        
    }
    
    // MARK: -Helpers
    
}


// MARK: - UITableViewDelegate
extension NewsSharePostDetailView: UITableViewDelegate {
    
}
// MARK: - UITableViewDataSource
extension NewsSharePostDetailView: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
        if indexPath.row == 0 {
            return 546
        }
        else {
            return 125
        }
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let NewsSharePostCell = newssharepostTV.dequeueReusableCell(withIdentifier: "NewsSharePostCell", for: indexPath) as! NewsSharePostCell
                return NewsSharePostCell
            }
            else {
                let CommentCell = newssharepostTV.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
                return CommentCell
            }
        }
    
        return UITableViewCell()
    }
}
