//
//  AppDelegate.swift
//  Swift-Sample-UICollectionViewController-UIViewController-in-Cell
//
//  Created by A10 Lab Inc. 003 on 2018/08/18.
//  Copyright © 2018年 A10 Lab Inc. 003. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let items: [DataItem] = [
        DataItem(title: "Blue", color: .blue, contents: ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"]),
        DataItem(title: "Green", color: .green, contents: ["1", "b", "3", "d", "5", "f", "7", "h", "9", "j", "11", "l", "13", "n"]),
        DataItem(title: "Yellow", color: .yellow, contents: ["A", "b", "C", "d", "E", "f", "G", "h", "I", "j", "K", "l", "M", "n"]),
        DataItem(title: "Cyan", color: .cyan, contents: ["a", "b", "c", "d", "e", "f"]),
        DataItem(title: "Magenta", color: .magenta, contents: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"]),
        DataItem(title: "Orange", color: .orange, contents: ["h", "i", "j", "k", "l", "m", "n"]),
        DataItem(title: "Purple", color: .purple, contents: ["f", "g", "h", "i", "j", "k", "l", "m", "1", "2", "3"]),
        DataItem(title: "DarkGray", color: .darkGray, contents: ["a", "b", "1", "d", "e", "2", "g", "h", "3", "j", "k", "4", "m", "n"])
    ]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.red
        UINavigationBar.appearance().tintColor = UIColor.white

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: CollectionViewController(items: items))
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

