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
    
    func applicationWillTerminate(_ application: UIApplication) {//автосохранение в coreData при выходе из приложения
        self.saveContext()
    }
    
    //загрузка базы
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ImagesData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    //сохранение в базу
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Error \(nserror), \(nserror.userInfo)")

            }
        }
    }

    
}

