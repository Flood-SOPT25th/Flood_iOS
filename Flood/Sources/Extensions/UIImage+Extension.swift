//
//  UIImage+Extensions.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/01.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import UIKit

extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

