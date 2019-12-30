//
//  CommentCell.swift
//  Flood
//
//  Created by hjyoo on 2019/12/27.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var commentprofileImg: UIImageView!
    @IBOutlet weak var commentName: UILabel!
    @IBOutlet weak var commentTime: UILabel!
    @IBOutlet weak var commentPost: UILabel!
    @IBOutlet weak var commentReply: UILabel!
    
    override func awakeFromNib() {
      super.awakeFromNib()
      
    }
    
}

