//
//  PhotoRouter.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 25.11.2022.
//

import Foundation

protocol PhotoRouterInputProtocol {
    init(viewController: PhotoViewController)
    func openDetailViewController(with photo: ApiResponse)
}

class PhotoRouter: PhotoRouterInputProtocol {
    unowned let viewController: PhotoViewController
    
    required init(viewController: PhotoViewController) {
        self.viewController = viewController
    }
    
    func openDetailViewController(with photo: ApiResponse) {
        
    }
    
    
}
