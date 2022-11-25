//
//  DetailConfigurator.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 24.11.2022.
//

import Foundation

protocol DetailConfiguratorInputProtocol {
    func configure(with viewController: DetailViewController, and detail: Result)
}

class DetailConfigurator: DetailConfiguratorInputProtocol {
    func configure(with viewController: DetailViewController, and detail: Result) {
        let presenter = DetailPresenter(view: viewController)
        let intreactor = DetailInteractor(presenter: presenter, detail: detail)
        
        viewController.presenter = presenter
        presenter.interactor = intreactor
    }
    
    
}
