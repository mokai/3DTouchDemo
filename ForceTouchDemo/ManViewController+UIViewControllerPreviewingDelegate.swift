//
//  ManViewController+UIViewControllerPreviewingDelegate.swift
//  ForceTouchDemo
//
//  Created by gongkai on 15/10/22.
//  Copyright © 2015年 mokai. All rights reserved.
//

import UIKit

extension ManViewController:UIViewControllerPreviewingDelegate{
    
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        var vc:UIViewController?
        switch previewingContext.sourceView.tag{
        case 1: //头像
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("UserViewController")
        case 2://评论
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("UserViewController")
        case 3://收藏
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("UserViewController")
        default://
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("UserViewController")
        }
        //vc!.beginPeek()
        return vc
    }
    
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        viewControllerToCommit.endPeek()
        showViewController(viewControllerToCommit, sender: self)
    }
    
}

