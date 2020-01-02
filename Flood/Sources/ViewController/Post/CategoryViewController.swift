//
//  CategoryViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/29.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

protocol CategoryDelegate {
    func didSelectCategory(category: String)
}

class CategoryViewController: UIViewController {

    // MARK: - UI components
    @IBOutlet weak var categoryTableView: UITableView!
    
    
    // MARK: - Variables and Properties

//    var Groupcategory : [GroupCategory]
    var delegate : CategoryDelegate?
    var categoryList : [String]!
    
    // MARK: - Dummy Data
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.categoryTableView.delegate = self
        self.categoryTableView.separatorStyle = .none
        setNavBar()
        
    }
    
    // MARK: -Helpers
    
    func setNavBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
        view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "카테고리 선택")
        navBar.setItems([navItem], animated: false)
        
        navBar.setBackgroundImage(UIImage(), for:.default)
        navBar.shadowImage = UIImage()
        navBar.layoutIfNeeded()
        navBar.barTintColor = .white
    }
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
        cell.categoryLabel.text = categoryList[indexPath.row]
        
        return cell
    }

    private func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        tableView.sectionHeaderHeight = 44

        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        label.text = "카테고리 선택"
        label.textColor = .black
        
        view.addSubview(label)
        self.view.addSubview(view)

        return view
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let categoryText = categoryList?[indexPath.row] else { return }
        delegate?.didSelectCategory(category: categoryText)
        dismiss(animated: true, completion: nil)
    }

}


