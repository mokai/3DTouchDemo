//
//  ManTableVCCell.swift
//  ForceTouchDemo
//
//  Created by gongkai on 15/10/22.
//  Copyright © 2015年 mokai. All rights reserved.
//

import UIKit

class ManTableVCCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var nameBtn: UIButton!
    
    @IBOutlet weak var commentBtn: UIButton!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    
    override func awakeFromNib() {
        let layer = self.nameBtn.layer
        layer.masksToBounds = true
        layer.cornerRadius = self.nameBtn.frame.size.width / 2
    }
    
    func setModel(model:Model,index:NSIndexPath){
        self.bgView.image = UIImage(named: "\(index.row+1)")
        self.nameBtn.setImage(UIImage(named: "avater\(index.row+1)"), forState: .Normal)
        self.commentBtn.setTitle("评论\(model.comments)", forState: .Normal)
        self.likeBtn.setTitle("\(model.like)", forState: .Normal)
    }
}
