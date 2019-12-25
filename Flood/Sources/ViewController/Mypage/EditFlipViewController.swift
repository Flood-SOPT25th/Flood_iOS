//
//  EditFlipViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/24.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class EditFlipViewController: UIViewController {

    // MARK: - UI components


    // MARK: - Variables and Properties

    
    // MARK: - Dummy Data
    
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.isNavigationBarHidden = true
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.isNavigationBarHidden = false
//    }

    // MARK: -Helpers

    @objc func setNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
}
