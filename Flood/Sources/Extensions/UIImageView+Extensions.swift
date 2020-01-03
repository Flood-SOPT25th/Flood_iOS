//
//  UIImageView+Extensions.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/01.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

// Kingfisher를 이용하여 url로부터 이미지를 가져오는 extension
extension UIImageView {
    
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
    
}

