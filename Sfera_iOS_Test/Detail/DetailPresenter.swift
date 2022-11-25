//
//  DetailPresenter.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 24.11.2022.
//

import UIKit

struct DetailsData {
    let locationName: String
    let authorName: String
    let likes: Int
    let imageData: Data?
    
}


class DetailPresenter: DetailViewOutputProtocol {
    unowned let view: DetailViewInputProtocol
    var interactor: DetailInteractorInputProtocol!
    
    required init(view: DetailViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideDetail()
    }
    
    
}

// MARK: - DetailInteractorOutputProtocol
extension DetailPresenter: DetailInteractorOutputProtocol {
    func receiveDetail(with data: DetailsData) {
        let author = "Location: \(data.authorName)"
        let likes = "Likes: \(data.likes)"
        
        view.displayLocation(with: data.locationName)
        view.displayAuthor(with: author)
        view.displayLikes(with: likes)
        view.displayImage(with: data.imageData!)
    }
}
