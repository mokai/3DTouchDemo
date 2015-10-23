//
//  UserViewController.swift
//  ForceTouchDemo
//
//  Created by gongkai on 15/10/22.
//  Copyright © 2015年 mokai. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var avaterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    var model:Model?
    
    lazy var previewActions: [UIPreviewActionItem] = {
        func previewActionForTitle(title: String, style: UIPreviewActionStyle = .Default) -> UIPreviewAction {
            return UIPreviewAction(title: title, style: style) { previewAction, viewController in
                print("点击了\(title)")
            }
        }
        
        let action1 = previewActionForTitle("关注TA",style: .Destructive)
        let action2 = previewActionForTitle("私信TA")
        
        let subAction1 = previewActionForTitle("微博")
        let subAction2 = previewActionForTitle("好友圈")
        let subAction3 = previewActionForTitle("QQ")
        let subAction4 = previewActionForTitle("微信")
        let groupedActions = UIPreviewActionGroup(title: "分享…", style: .Default, actions: [subAction1, subAction2,subAction3,subAction4] )
        
        return [action1, action2, groupedActions]
    }()
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        let layer = self.avaterImageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = self.avaterImageView.frame.size.width / 2
    
        self.nameLabel.text = model!.name
        self.avaterImageView.image = UIImage(named: "avater\(model!.index)")
    }
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        return previewActions
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
        self.navigationController?.navigationBar.hidden = false
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    //开始Peek
    override func beginPeek(){
        self.backBtn.hidden = true
    }
    
    //结束Peek,真正打开VC
    override func endPeek(){
        self.backBtn.hidden = false
    }
    
    //MARK:- UI Event
    @IBAction func backAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
}



