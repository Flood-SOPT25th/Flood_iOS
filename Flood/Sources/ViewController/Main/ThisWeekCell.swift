//
//  ThisWeekCell.swift
//  Flood
//
//  Created by hjyoo on 2019/12/26.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class ThisWeekCell: UITableViewCell {
    
    @IBOutlet weak var thisweekImg: UIImageView!
    @IBOutlet weak var thisweekprofileImg: UIImageView!
    @IBOutlet weak var thisweekName: UILabel!
    @IBOutlet weak var thisweekTime: UILabel!
    @IBOutlet weak var thisweekPost: UILabel!

    @IBOutlet weak var thisweekView: UIView!
    
    @IBOutlet weak var thisweekTitle: UILabel!
    @IBOutlet weak var thisweekflipCount: UILabel!
    @IBOutlet weak var thisweekMore: UIButton!
    @IBOutlet weak var thisweekBookmark: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thisweekName.sizeToFit()
        thisweekTime.sizeToFit()
        thisweekflipCount.sizeToFit()
        
        
        thisweekView.backgroundColor = .black
        thisweekView.alpha = 0.25
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func toWeb(url : String) {
        guard let url = URL(string : url),
            UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}

extension ThisWeekCell : PostDelegate {
    func didSelectPost(url : String) {
//        thisweekView.addGestureRecognizer((UITapGestureRecognizer(target: self, action: #selector(toWeb(url: url)))))
        
    }
    
}
