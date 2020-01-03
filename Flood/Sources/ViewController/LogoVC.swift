//
//  LogoVC.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/01.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import UIKit
import SwiftyGif

class LogoVC: UIViewController {

    let logoAnimationView = LogoAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()

    }

}

extension LogoVC: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
        
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        
        present(vc, animated: true)

    }
}
