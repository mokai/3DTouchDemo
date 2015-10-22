//
//  ViewController.swift
//  ForceTouchDemo
//
//  Created by gongkai on 15/10/22.
//  Copyright © 2015年 mokai. All rights reserved.
//

import UIKit

struct Model {
    var name:String
    var comments:Int
    var like:Int
}


class ManViewController: UITableViewController {

    
    let dataSource = [
        Model(name: "kk", comments: 20, like: 10),
        Model(name: "mokai", comments: 10, like: 11),
        Model(name: "小白", comments: 1, like: 12),
        Model(name: "隔壁老王", comments: 0, like: 13),
        Model(name: "赵日天", comments: 3, like: 21),
        Model(name: "xxx", comments: 20, like: 22),
        Model(name: "想不出名", comments: 5, like: 1),
        Model(name: "习大大", comments: 4, like: 2),
        Model(name: "Mogo", comments: 3, like: 3),
        Model(name: "Tim", comments: 2, like: 4),
        Model(name: "Jone", comments: 1, like: 6)
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 200;
        
        if traitCollection.forceTouchCapability == .Available {
            //注册View具有Previewing功能，View所有子视图
            registerForPreviewingWithDelegate(self, sourceView: view)
        }
        else {
            let alertController = UIAlertController(title: "3D Touch Not Available", message: "Unsupported device.", preferredStyle: .Alert)
            presentViewController(alertController, animated: true, completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("ManTableVCCell") as! ManTableVCCell
        cell.setModel(dataSource[indexPath.row], index: indexPath)
        return cell
    }
}

