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
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet weak var flipSubLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.setRounded(radius: 5)
        
    }

    
}
