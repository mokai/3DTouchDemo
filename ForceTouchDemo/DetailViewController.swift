//
//  DetailViewController.swift
//  ForceTouchDemo
//
//  Created by gongkai on 15/10/23.
//  Copyright © 2015年 mokai. All rights reserved.
//

import UIKit

enum DetailPeekType:Int{
    case Image = 1
    case Comments
}


class DetailViewController: UIViewController {
    @IBOutlet weak var commentsHeight: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    private var lastHeight:CGFloat!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentsView: UIView!
    
    var model:Model!
    var peekType:DetailPeekType!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "\(model.index)")
    }
    
    override func beginPeek() {
        if(peekType == .Comments){
            lastHeight = commentsHeight.constant
            commentsHeight.constant = self.view.frame.size.height
        }else{
            lastHeight = commentsHeight.constant
            imageViewHeight.priority = UILayoutPriorityRequired
            commentsHeight.constant = 0
        }
    }
    
    override func endPeek() {
        if(peekType == .Comments){
            commentsHeight.constant = lastHeight
        }else{
            commentsHeight.constant = lastHeight
        }
    }
    
    
}
