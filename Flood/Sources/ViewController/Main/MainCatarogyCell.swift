//
//  MainCatarogyCell.swift
//  Flood
//
//  Created by hjyoo on 2019/12/26.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class MainCatarogyCell: UICollectionViewCell {
    
    @IBOutlet var maincatarogy: UIButton?
    
    var isClick: Bool = true {
        willSet {
            if newValue {
                self.maincatarogy?.backgroundColor = UIColor(red: 0, green: 87, blue: 255, alpha: 1)
                self.maincatarogy?.setTitleColor(.white, for: .normal)
                   }
            else {
                self.maincatarogy?.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
                self.maincatarogy?.setTitleColor(.veryLightPink, for: .normal)
            }
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
