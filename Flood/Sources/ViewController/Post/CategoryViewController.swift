//
//  CategoryViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/29.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    // MARK: - UI components
    @IBOutlet weak var categoryTableView: UITableView!

    // MARK: - Variables and Properties

    var categoryList : [String]!
        
    // MARK: - Dummy Data
    
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "카테고리 선택"
        
        categoryTableView.delegate = self
        self.categoryTableView.separatorStyle = .none

        print(categoryList)
        print(categoryList!)
        print(categoryList.count)
        
    }
    
    // MARK: -Helpers

}

// MARK: - UITableViewDelegate

extension CategoryViewController : UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension CategoryViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        cell.categoryLabel.textColor = .veryLightPink
        cell.categoryLabel.text = categoryList![indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController
        let categoryText : String? = categoryList![indexPath.row]
        
        if let unwrappedName = categoryText {
            view?.categoryBtn.setTitle(unwrappedName, for: .normal)
        } else {
           print("")
        }
            
        dismiss(animated: true, completion: nil)
        
    }

}
