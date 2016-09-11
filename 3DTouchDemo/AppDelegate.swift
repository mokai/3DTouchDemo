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
        static var preSong = (
            title: "上次听歌",
            subtitle: "Let it go - Demi Lovato",
            type: "me.mokai.action.presong",
            userinfo: ["url" : "http://music.baidu.com/song/92279724?fm=altg_new3" ]
        )
        static var lastSong = (
            title: "最近听歌",
            subtitle: "Let it go - Demi Lovato",
            type: "me.mokai.action.lastsong",
            userinfo: ["url" : "http://music.baidu.com/song/92279724?fm=altg_new3"]
        )
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        print(application.shortcutItems)
        //MARK:添加Action
        if application.shortcutItems?.count == 0 { //first one
            let preSongItem = UIApplicationShortcutItem(type: QuickType.preSong.type, localizedTitle: QuickType.preSong.title , localizedSubtitle: QuickType.preSong.subtitle, icon: UIApplicationShortcutIcon(type: .Play), userInfo: QuickType.preSong.userinfo)
            application.shortcutItems = [preSongItem]
        }else{
            //change
            let lastSongItem = UIApplicationShortcutItem(type: QuickType.lastSong.type, localizedTitle: QuickType.lastSong.title , localizedSubtitle: QuickType.lastSong.subtitle, icon: UIApplicationShortcutIcon(type: .Play), userInfo: QuickType.lastSong.userinfo)
            application.shortcutItems = [lastSongItem]
        }
        
        return true
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        //MARK:可以在这里根据type与userinfo来进行页面跳转
        let type = shortcutItem.type
        let userinfo = shortcutItem.userInfo
        print("quick action:\(shortcutItem.localizedTitle):type<\(type)>:userinfo<\(userinfo)>")
    }
    
}

