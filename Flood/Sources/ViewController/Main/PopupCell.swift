//
//  PopupCell.swift
//  Flood
//
//  Created by hjyoo on 2019/12/29.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class PopupCell: UICollectionViewCell {
    
    @IBOutlet weak var bookmarkImg: UIImageView!
    @IBOutlet weak var bookmarkName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bookmarkImg.setRounded(radius: 10)
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
