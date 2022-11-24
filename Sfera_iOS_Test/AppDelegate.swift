//
//  AppDelegate.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 19.11.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainTabBarViewController()
        self.window?.makeKeyAndVisible()
        self.window?.overrideUserInterfaceStyle = .light
       
        return true
    }

    
}

