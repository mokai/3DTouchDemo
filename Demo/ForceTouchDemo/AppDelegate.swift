//
//  AppDelegate.swift
//  ForceTouchDemo
//
//  Created by gongkai on 15/10/22.
//  Copyright © 2015年 mokai. All rights reserved.
//

import UIKit




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

struct QuickType {
    static var preSong = (title:"最近听歌",subtitle:"Let it go - Demi Lovato",type:"me.mokai.action.presong",userinfo:["url":"http://music.baidu.com/song/92279724?fm=altg_new3"])
}
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    //MARK:动态追加Item
    if application.shortcutItems?.first?.type != QuickType.preSong.type{
        let preSongItem = UIApplicationShortcutItem(type: QuickType.preSong.type, localizedTitle:QuickType.preSong.title , localizedSubtitle: QuickType.preSong.subtitle, icon: UIApplicationShortcutIcon(type: .Play), userInfo: QuickType.preSong.userinfo)
        var shortcutItems = application.shortcutItems
        shortcutItems?.append(preSongItem)
        application.shortcutItems = shortcutItems
    }else{
        print("已经添加")
    }
    return true
}
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        //MARK:可以在这里根据type与userinfo来进行页面跳转
        let type = shortcutItem.type
        let userinfo = shortcutItem.userInfo
        print("quick action:\(shortcutItem.localizedTitle):userinfo<\(userinfo)>")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

