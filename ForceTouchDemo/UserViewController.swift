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
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        let layer = self.avaterImageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = self.avaterImageView.frame.size.width / 2
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
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
        self.navigationController?.navigationBar.hidden = false
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



