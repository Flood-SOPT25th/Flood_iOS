//
//  SectionHeaderCell.swift
//  Flood
//
//  Created by Junhyeon on 2020/01/04.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import UIKit

class SectionHeaderCell: UITableViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var decorationImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
