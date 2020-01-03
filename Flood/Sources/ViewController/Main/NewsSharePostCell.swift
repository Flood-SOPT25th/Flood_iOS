//
//  NewsSharePostCell.swift
//  Flood
//
//  Created by hjyoo on 2019/12/26.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class NewsSharePostCell: UITableViewCell {
    
    @IBOutlet weak var newsshareCatarogy: UILabel!
    @IBOutlet weak var newsshareCatagoryView: UIView!
    @IBOutlet weak var newsshareprofileImg: UIImageView!
    @IBOutlet weak var newsshareName: UILabel!
    @IBOutlet weak var newsshareTime: UILabel!
    @IBOutlet weak var newssharePost: UILabel!
    @IBOutlet weak var newsshareMore: UIButton!
    
    @IBOutlet weak var picture1: UIImageView!
    @IBOutlet weak var picture2: UIImageView!
    @IBOutlet weak var picture3: UIImageView!
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsPost: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    
    @IBOutlet weak var newsflipCount: UILabel!
    @IBOutlet weak var newsshareBookmark: UIButton!
    
    @IBOutlet weak var newsshareView: UIView!
    @IBOutlet weak var picturepostView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // initialize
        newsshareCatarogy.sizeToFit()
        newsshareName.sizeToFit()
        newsshareTime.sizeToFit()
        newsflipCount.sizeToFit()
    }
}
/*
 @IBOutlet weak var picturepostMore: UIButton!
 
 @IBOutlet weak var picture1: UIImageView!
 @IBOutlet weak var picture2: UIImageView!
 @IBOutlet weak var picture3: UIImageView!
 
 @IBOutlet weak var newsTitle: UILabel!
 @IBOutlet weak var newsPost: UILabel!
 @IBOutlet weak var newsImg: UIImageView!
 
 @IBOutlet weak var picturefilpCount: UILabel!
 @IBOutlet weak var picturepostBookmark: UIButton!
 
 @IBOutlet weak var picturepostView: UIView!
 @IBOutlet weak var newsshareView: UIView!
 
 
 override func awakeFromNib() {
      super.awakeFromNib()
      // initialize
      picturepostCatagory.sizeToFit()
      picturepostName.sizeToFit()
      picturepostTime.sizeToFit()
      picturefilpCount.sizeToFit()
  }
 */
