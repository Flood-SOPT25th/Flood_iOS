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
    @IBOutlet weak var postprofileImg: UIImageView!
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postPost: UILabel!
    @IBOutlet weak var postMore: UIImageView!
    //@IBOutlet weak var postBookmark: UIButton!
    @IBOutlet weak var postfilpCount: UILabel!
    
    var delegate = UIViewController()
    
 
    @IBAction func postBookmark(_ sender: UIButton) {

        func show(){
            
            let actionsheet = UIAlertController(title: "플립에 저장", message: nil, preferredStyle: .actionSheet)
            
            let view = UIView(frame: CGRect(x: 8.0, y: 8.0, width: actionsheet.view.bounds.size.width - 8.0 * 4.5, height: 120.0))
            view.backgroundColor = UIColor.green
            actionsheet.view.addSubview(view)
            
            actionsheet.addAction(UIAlertAction(title: "Add to a Playlist", style: .default, handler: nil))
            actionsheet.addAction(UIAlertAction(title: "Create Playlist", style: .default, handler: nil))
            actionsheet.addAction(UIAlertAction(title: "Remove from this Playlist", style: .default, handler: nil))

            actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            

            delegate.present(actionsheet, animated: true, completion: nil)
            //present(actionsheet, animated: true, completion: nil)
        }

        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


}
 
