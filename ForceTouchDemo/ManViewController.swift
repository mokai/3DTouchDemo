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
    var index:Int
}


class ManViewController: UITableViewController {
    let dataSource = [
        Model(name: "kk", comments: 20, like: 10,index:1),
        Model(name: "mokai", comments: 10, like: 11,index:2),
        Model(name: "小白", comments: 1, like: 12,index:3),
        Model(name: "隔壁老王", comments: 0, like: 13 ,index:4),
        Model(name: "赵日天", comments: 3, like: 21,index:5),
        Model(name: "xxx", comments: 20, like: 22,index:6),
        Model(name: "想不出名", comments: 5, like: 1,index:7),
        Model(name: "习大大", comments: 4, like: 2,index:8),
        Model(name: "Mogo", comments: 3, like: 3,index:9),
        Model(name: "Tim", comments: 2, like: 4,index:10),
        Model(name: "Jone", comments: 1, like: 6,index:11)
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
        //保证只执行一次，虽然多执行几次也没什么关系
        weak var wself = self
        dispatch_once(&cell.once_t) { () -> Void in
            wself!.registerForPreviewingWithDelegate(wself!, sourceView: cell.nameBtn)
        }
        cell.setModel(dataSource[indexPath.row])
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail",let indexPath = tableView.indexPathForSelectedRow{
            let detailViewController = segue.destinationViewController  as! DetailViewController
            detailViewController.model = dataSource[indexPath.row]
        }
    }
}

