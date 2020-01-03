//
//  LogoAnimationView.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/01.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import UIKit
import SwiftyGif

class LogoAnimationView: UIView {

    let logoGifImageView: UIImageView = {
        guard let gifImage = try? UIImage(gifName: "splash_ios.gif") else {
            return UIImageView()
        }
        return UIImageView(gifImage: gifImage, loopCount: 1)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(white: 246.0 / 255.0, alpha: 1)
        addSubview(logoGifImageView)
        logoGifImageView.pinEdgesToSuperView()
        //        logoGifImageView.translatesAutoresizingMaskIntoConstraints = false
//        logoGifImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        logoGifImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        logoGifImageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
//        logoGifImageView.heightAnchor.constraint(equalToConstant: 108).isActive = true
    }

}
