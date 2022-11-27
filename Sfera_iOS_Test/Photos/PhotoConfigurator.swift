//
//  PhotoConfigurator.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 27.11.2022.
//

import Foundation

protocol PhotoConfiguratorInputProtocol {
    func configure(with viewController: PhotoViewController)
}


class PhotoConfigurator: PhotoConfiguratorInputProtocol {
    
    func configure(with viewController: PhotoViewController) {
        let presenter = PhotoPresenter(view: viewController)
        let interactor = PhotoInteractor(presenter: presenter)
        let router = PhotoRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
    }
}


