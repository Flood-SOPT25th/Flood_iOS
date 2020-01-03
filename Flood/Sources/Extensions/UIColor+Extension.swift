//
//  UIColor+extension.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/25.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }


  @nonobjc class var white: UIColor {
    return UIColor(white: 1.0, alpha: 1.0)
  }

  @nonobjc class var veryLightPink: UIColor {
    return UIColor(white: 209.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var electricBlue: UIColor {
    return UIColor(red: 0.0, green: 87.0 / 255.0, blue: 1.0, alpha: 1.0)
  }

  @nonobjc class var black: UIColor {
    return UIColor(white: 40.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var veryLightPinkTwo: UIColor {
    return UIColor(white: 237.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var brownGrey: UIColor {
    return UIColor(white: 163.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var apricot: UIColor {
    return UIColor(red: 1.0, green: 172.0 / 255.0, blue: 101.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var skyBlue: UIColor {
    return UIColor(red: 128.0 / 255.0, green: 182.0 / 255.0, blue: 235.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var mediumGreen: UIColor {
    return UIColor(red: 58.0 / 255.0, green: 147.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var lightMustard: UIColor {
    return UIColor(red: 252.0 / 255.0, green: 208.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var black40: UIColor {
    return UIColor(white: 0.0, alpha: 0.4)
  }

  @nonobjc class var blackTwo: UIColor {
    return UIColor(white: 0.0, alpha: 1.0)
  }

  @nonobjc class var paleGrey: UIColor {
    return UIColor(red: 248.0 / 255.0, green: 249.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var lightBlueGrey76: UIColor {
    return UIColor(red: 204.0 / 255.0, green: 206.0 / 255.0, blue: 211.0 / 255.0, alpha: 0.76)
  }

  @nonobjc class var gunmetal: UIColor {
    return UIColor(red: 80.0 / 255.0, green: 85.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var lightGreyBlue: UIColor {
    return UIColor(red: 173.0 / 255.0, green: 179.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var paleGreyTwo: UIColor {
    return UIColor(red: 252.0 / 255.0, green: 252.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var brownishGrey: UIColor {
    return UIColor(white: 112.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var veryLightPinkThree: UIColor {
    return UIColor(white: 208.0 / 255.0, alpha: 1.0)
  }

}
