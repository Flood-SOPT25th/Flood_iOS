//
//  UIViewcontroller+extensions.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/25.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // 2칸인 alert title - up, message - down
    func defaultAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // 누르면 앱이 종료되는 alert
    func exitAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { (action) in
            exit(0)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: -TODO 선택형 alert
    func sheetAlert(){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "취소", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

}
