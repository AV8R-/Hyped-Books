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
import Result
import APIService
import Model

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    struct BookWrapper: Codable {
        let book: Book
    }

    enum DummyError: APIServiceError {
        init(apiError: APIError) {
            self = .nested(error: apiError)
        }
        
        case nested(error: Swift.Error)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let locator = ServiceLoader.shared
        let hub = ServiceHUB.shared
        hub.prepare(locator: locator)
        
        do {
            let apiClient: APIClient = try inject()
            let listEndpoint: Endpoint = .list(page: 0)
            let bookEndpoint: Endpoint = .book(uuid: "iemWF1Zx")
            apiClient.request(listEndpoint) { (result: Result<BookList, DummyError>) in
                print(result)
            }
            apiClient.request(bookEndpoint) { (result: Result<BookWrapper, DummyError>) in
                print(result)
            }
        } catch {
            print(error)
        }
        
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

