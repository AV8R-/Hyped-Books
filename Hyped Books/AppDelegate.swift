//
//  AppDelegate.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 01/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit
import Services
import ServiceLocator
import BooksService
import Pager
import Result

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var bookPager: Pager<PagedBookServie>!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let locator = ServiceLoader.shared
        let hub = ServiceHUB.shared
        hub.prepare(locator: locator)
        
        let books: BooksService = try! inject()
        let pagedBooks = PagedBookServie(service: books)
        bookPager = Pager(service: pagedBooks)
        
        bookPager.loadMore { result in
            print(result)
            self.bookPager.loadMore { result in
                print(result)
            }
        }
        
        books.fetchBook(byUUID: "iemWF1Zx") { result in
//            print(result)
        }
        
//        books.fetchList(page: 0) { result in
//            print(result.value?.count as Any)
//        }
        
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

