//
//  MainTabBarViewController.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 19.11.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBar.backgroundColor = UIColor.systemGray5
        
        viewControllers = [
            generatedNavControl(rootViewController: PhotoViewController(), title: "Фото", image: UIImage(systemName: "photo.circle")!, selectedImage: UIImage(systemName: "photo.circle.fill")!),
//            generatedNavControl(rootViewController: ListViewController(), title: "Список дел", image: UIImage(systemName: "list.bullet.circle")!, selectedImage: UIImage(systemName: "list.bullet.circle.fill")!),
            generatedNavControl(rootViewController: MapViewController(), title: "Карта", image: UIImage(systemName: "map.circle")!, selectedImage: UIImage(systemName: "map.circle.fill")!)
        ]
        
    }
    
    private func generatedNavControl(rootViewController: UIViewController, title: String, image: UIImage, selectedImage: UIImage) -> UIViewController {
        let navgationVC = UINavigationController(rootViewController: rootViewController)
        navgationVC.tabBarItem.title = title
        navgationVC.tabBarItem.image = image
        navgationVC.tabBarItem.selectedImage = selectedImage
        return navgationVC
    }
    
}
