//
//  MypageFlipCollectionViewCell.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/24.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class MypageFlipCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var flipImageView: UIImageView!
    @IBOutlet weak var flipSubLabel: UILabel!
    @IBOutlet weak var flipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.setRounded(radius: 5)
        
    }

    
}
