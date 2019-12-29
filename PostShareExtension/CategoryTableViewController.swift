//
//  CategoryTableViewController.swift
//  PostShareExtension
//
//  Created by Junhyeon on 2019/12/29.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

protocol CategoryViewProtocol {
    func sendingViewController(viewController: CategoryTableViewController, sentItem: String)
}


class CategoryTableViewController: UITableViewController {
    
    
    var categoryList: [String] = ["카카오", "네이버", "NHN", "Google", "배달의 민족"]
    var delegate: CategoryViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.categoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CategoryCell")
        }
        
        cell?.textLabel!.text = self.categoryList[indexPath.item]
        
        return cell!
    }
    
}

