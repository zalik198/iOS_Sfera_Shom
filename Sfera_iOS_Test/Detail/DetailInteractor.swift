//
//  DetailInteractor.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 24.11.2022.
//

import Foundation
import UIKit

protocol DetailInteractorInputProtocol: AnyObject {
    init(presenter: DetailInteractorOutputProtocol, detail: Result)
    func provideDetail()
}

protocol DetailInteractorOutputProtocol: AnyObject {
    func receiveDetail(with data: DetailsData)
}

class DetailInteractor: DetailInteractorInputProtocol {

    unowned let presenter: DetailInteractorOutputProtocol
    private let detail: Result
    
    required init(presenter: DetailInteractorOutputProtocol, detail: Result) {
        self.presenter = presenter
        self.detail = detail
    }
    
    func provideDetail() {
        let newImage = ImageManager.shared.fetchData(from: URL(string: detail.urls.regular))
        let detailData = DetailsData(
            locationName: detail.user.location ?? "Местоположение не указано",
            authorName: detail.user.name,
            likes: detail.likes,
            imageData: newImage.unsafelyUnwrapped
        )
        presenter.receiveDetail(with: detailData)
    }

}
