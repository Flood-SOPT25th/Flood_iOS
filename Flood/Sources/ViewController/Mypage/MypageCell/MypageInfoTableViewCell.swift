//
//  MypageInfoTableViewCell.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/30.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class MypageInfoTableViewCell: UITableViewCell {
 
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var proflieIMG: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileDepartment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
