//
//  AlarmViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/23.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
  
    // MARK: - UI components
    @IBOutlet weak var alarmTableView: UITableView!
    
    
    // MARK: - Variables and Properties

    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    // MARK: -Helpers
    
}

extension AlarmViewController : UITableViewDelegate { }


//extension AlarmViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        switch section {
//        case 0:
//
//            return 1
//        case 1:
//            return 1
//        case 2:
//            return 1
//        default:
//            return 1
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//
//
//}
