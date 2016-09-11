//
//  ManViewController+UIViewControllerPreviewingDelegate.swift
//  ForceTouchDemo
//
//  Created by gongkai on 15/10/22.
//  Copyright © 2015年 mokai. All rights reserved.
//

import UIKit

extension ManViewController: UIViewControllerPreviewingDelegate{
    
    //轻压
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print(previewingContext.sourceView.tag)
        var location = location
        //根据点击位置算出Row
        if(previewingContext.sourceView.tag != 0){ //如果不是在UITableView上触发的则是子视图，先转换为UITableView的Point
            location = previewingContext.sourceView.convertPoint(location, toView: self.tableView)
        }
        let index = super.tableView.indexPathForRowAtPoint(location)
        let model = dataSource[index!.row]
        
        var vc:UIViewController?
        switch previewingContext.sourceView.tag {
        case 1: //头像
            let userVc = self.storyboard?.instantiateViewControllerWithIdentifier("UserViewController") as! UserViewController
            userVc.model = model
            vc = userVc
        case 2://评论
            let detailVc = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
            detailVc.model = model
            detailVc.peekType = .Comments
            vc = detailVc
        default://图片
            let detailVc = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
            detailVc.model = model
            detailVc.peekType = .Image
            //设置Peek的高度
            detailVc.preferredContentSize = CGSize(width: 0.0, height: 320);
            vc = detailVc
        }
        vc?.view //先访问一下view，初始化
        vc?.beginPeek() //peek开始
        return vc
    }
    
    //重压
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        viewControllerToCommit.endPeek()  //peek结束
        showViewController(viewControllerToCommit, sender: self)
    }
}