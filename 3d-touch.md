---
layout: post
title: "3D Touch使用"
date: 2015-10-27
comments: true
categories: 记录
tags: "3D Touch"
---

3D Touch技术最先应用在Apple Watch上面，但叫`Force Touch`，后在iPhone6s上加入了此技术，并改名3D Touch。值得注意的是目前3D Touch只支持iPhone6S以后的机型，包括6s的模拟器也不支持，不过Github上的[SBShortcutMenuSimulator](https://github.com/DeskConnect/SBShortcutMenuSimulator)项目通过Hack方式已经实现了`Quick Actions`，但不能使用`Peek&Pop`。

<!--more-->

如果你还不知道3D Touch是什么，可以看看官方的[宣传视频](http://images.apple.com/media/us/iphone-6s/2015/dhs3b549_75f9_422a_9470_4a09e709b350/films/feature/iphone6s-feature-cc-us-20150909_r848-9dwc.mov)。


目前3D Touch目前可以分为三种：

* Quick Actions可以理解PC桌面的快捷方式
* Peek&Pop应用内快速预览内容
* UITouch自定义3D Touch事件

## Quick Actions
配置Actions可以通过工程`Info.plist`文件静态配置，也可以在运行时动态添加，两者间可以一起使用。

静态配置在添加`Info.plist`中的`UIApplicationShortcutItems`节点中添加相应Action信息，

```
<key>UIApplicationShortcutItems</key>
<array>
	<dict>
		<key>UIApplicationShortcutItemIconType</key>
		<string>UIApplicationShortcutIconTypeSearch</string>
		<key>UIApplicationShortcutItemTitle</key>
		<string>搜索</string>
		<key>UIApplicationShortcutItemType</key>
		<string>me.mokai.action.search</string>
	</dict>
	<dict>
		<key>UIApplicationShortcutItemIconFile</key>
		<string>quick_filter</string>
		<key>UIApplicationShortcutItemTitle</key>
		<string>听歌识别</string>
		<key>UIApplicationShortcutItemType</key>
		<string>me.mokai.action.identify</string>
	</dict>
	<dict>
		<key>UIApplicationShortcutItemIconFile</key>
		<string>quick_randomlisten</string>
		<key>UIApplicationShortcutItemTitle</key>
		<string>随便听听</string>
		<key>UIApplicationShortcutItemType</key>
		<string>me.mokai.action.pay</string>
	</dict>
</array>
```	
其中`UIApplicationShortcutItemIconType`与`UIApplicationShortcutItemIconFile`都是指定Action的图标，前者是使用系统定义的后者使用自定义图标。`UIApplicationShortcutItemType`为Action标识，用于区分哪个Action被点击。

动态配置通过`UIApplication的shortcutItems`添加，shortcutItems是`UIApplicationShortcutItem`数组。需要注意的是，shortcutItems中的值生命周期是随APP在手机的安装与卸载，安装后第一次启动应用，shortcutItems中的Actions是静态配置的内容，

像我们上面静态配置了Actions，那么shortcutItems是包含这些Actions的，而非为空。所以我们在附加时应该先判断是否为空

```
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
```



核心类是UIApplicationShortItem，代表一个

动态配置

## Peek&Pop
使用场合

## UITouch


##参考
[Adopting 3D Touch on iPhone](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/Adopting3DTouchOniPhone/)




