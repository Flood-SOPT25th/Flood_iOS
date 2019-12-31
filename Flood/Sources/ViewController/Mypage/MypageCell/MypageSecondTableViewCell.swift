//
//  MypageSecondTableViewCell.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/30.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class MypageSecondTableViewCell: UITableViewCell {

    @IBOutlet weak var myPostCntLabel: UIView!
    @IBOutlet weak var myPostBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
