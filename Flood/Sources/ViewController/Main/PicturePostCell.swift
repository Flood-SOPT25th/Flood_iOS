//
//  PicturePostCell.swift
//  Flood
//
//  Created by hjyoo on 2019/12/26.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class PicturePostCell: UITableViewCell {
    
    @IBOutlet weak var picturepostCatagory: UILabel!
    @IBOutlet weak var picturepostprofileImg: UIImageView!
    @IBOutlet weak var picturepostName: UILabel!
    @IBOutlet weak var picturepostTime: UILabel!
    @IBOutlet weak var picturepostPost: UILabel!
    @IBOutlet weak var picturepostMore: UIButton!
    
    
    @IBOutlet weak var picture1: UIImageView!
    @IBOutlet weak var picture2: UIImageView!
    @IBOutlet weak var picture3: UIImageView!
    
    @IBOutlet weak var picturefilpCount: UILabel!
    @IBOutlet weak var picturepostBookmark: UIButton!
    
    @IBOutlet weak var picturepostView: UIView!
    
    override func awakeFromNib() {
         super.awakeFromNib()
         // initialize
         picturepostCatagory.sizeToFit()
         picturepostName.sizeToFit()
         picturepostTime.sizeToFit()
         picturefilpCount.sizeToFit()
     }
    
}

