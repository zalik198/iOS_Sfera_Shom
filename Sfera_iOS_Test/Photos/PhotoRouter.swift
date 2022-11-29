//
//  PhotoRouter.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 25.11.2022.
//

import UIKit

protocol PhotoRouterInputProtocol {

    init(viewController: PhotoViewController)
    func openDetailViewController(with vc: UIViewController)
}

class PhotoRouter: PhotoRouterInputProtocol {
    unowned let viewController: PhotoViewController
    
    required init(viewController: PhotoViewController) {
        self.viewController = viewController
    }
    
    func openDetailViewController(with vc: UIViewController) {
        vc.modalPresentationStyle = .automatic
        viewController.present(vc, animated: true)
    }
    
    
}
