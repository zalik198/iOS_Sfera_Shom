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
        tabBar.backgroundColor = UIColor.systemGray5
        
        viewControllers = [
            generatedNavControl(rootViewController: PhotoViewController(), title: "Photo", image: UIImage(systemName: "photo.circle")!, selectedImage: UIImage(systemName: "photo.circle.fill")!),
            generatedNavControl(rootViewController: FavoriteViewController(), title: "Favorite", image: UIImage(systemName: "heart.circle")!, selectedImage: UIImage(systemName: "heart.circle.fill")!)
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
