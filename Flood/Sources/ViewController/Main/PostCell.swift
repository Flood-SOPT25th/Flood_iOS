//
//  PostCell.swift
//  Flood
//
//  Created by hjyoo on 2019/12/26.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postCatagory: UILabel!
    @IBOutlet weak var postCatagoryView: UIView!
    @IBOutlet weak var postprofileImg: UIImageView!
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postPost: UILabel!
    @IBOutlet weak var postMore: UIButton!
    @IBOutlet weak var postBookmark: UIButton!
    @IBOutlet weak var postfilpCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postCatagory.sizeToFit()
        postName.sizeToFit()
        postTime.sizeToFit()
        postfilpCount.sizeToFit()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


}
 
