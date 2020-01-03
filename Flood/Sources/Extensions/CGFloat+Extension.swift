//
//  CGFloat+extension.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/25.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

extension CGFloat {
    
    func pixelsToPoints() -> CGFloat {
        return self / UIScreen.main.scale
    }
    
    static func onePixelInPoints() -> CGFloat {
        return CGFloat(1).pixelsToPoints()
    }

}

