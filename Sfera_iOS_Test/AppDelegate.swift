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
        self.window?.makeKeyAndVisible()
        self.window?.overrideUserInterfaceStyle = .light
        
        let tabBarController = UITabBarController()
        
        let photoViewController = ViewController()
        let photoNavigationController = UINavigationController(rootViewController: photoViewController)

        tabBarController.viewControllers = [photoNavigationController]

        self.window?.rootViewController = tabBarController

        
        return true
    }

    
}

