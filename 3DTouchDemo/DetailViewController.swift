//
//  DetailViewController.swift
//  ForceTouchDemo
//
//  Created by gongkai on 15/10/23.
//  Copyright © 2015年 mokai. All rights reserved.
//

import UIKit

enum DetailPeekType: Int{
    case Image = 1
    case Comments
}


class DetailViewController: UIViewController {
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    private var lastHeight: CGFloat!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentsView: UIView!
    
    var model: Model!
    var peekType: DetailPeekType!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "\(model.index)")
    }
    
    //开始时根据不同内容全屏
    override func beginPeek() {
        lastHeight = imageViewHeight.constant
        if(peekType == .Comments){
            imageViewHeight.constant = 0
        } else {
            imageViewHeight.constant = self.view.frame.size.height
        }
    }
    
    override func endPeek() {
        imageViewHeight.constant = lastHeight
    }
    
}
